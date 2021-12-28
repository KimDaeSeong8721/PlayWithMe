	var CellSize = 50;
	var SubCellSize = 13;
	var BoardSize = 9; 
	var canvas1 = document.getElementById("canvas1");                   //캔버스1 스도쿠판
	var canvas2 = document.getElementById("canvas2");					//캔버스2 숫자 버튼 
	var tbSerial = document.getElementById("tbSerial");           
	var extraInfo = document.getElementById("extraInfo");
	var boardXYOffset = 1.5; 
	var board1 = new Board();
	var ansboard = new Board();
	var selectRow = 0;
	var selectCol = 0;
	var showAllowed = true;
	var showSingles = true;
	var undoStack = Array();
	
	function drawGrid() {  // 실제로 그려지는 그리드 영역 
		var context = canvas1.getContext('2d'); //2D 공간을 생성함 

		
		// 안 두꺼운 부분 부터 칠함 
		for (var i = 0; i <= BoardSize; i++) {
			var thick = i % 3 == 0;  
			if (!thick)
			{
				context.beginPath();  //경로를 시작합니다
				context.strokeStyle = '#bec6d4';  //구분선은 검정, 일반선은 빨강
				context.lineWidth = 1;  //구분선은 두껍게 
				// 수직선을 그림 
				context.moveTo(i * CellSize +boardXYOffset, 0.5);  //
				context.lineTo(i * CellSize +boardXYOffset, BoardSize * CellSize + boardXYOffset);
				
				// 수평선을 그림 
				context.moveTo(boardXYOffset, i * CellSize +boardXYOffset);
				context.lineTo(BoardSize * CellSize + boardXYOffset, i * CellSize + boardXYOffset);	
				context.stroke();
			}
		}
		// 두꺼운 부분을 칠함
		for (var i = 0; i <= BoardSize; i++) {
			var thick = i % 3 == 0;   
			if (thick)
			{
				context.beginPath();  //경로를 시작합니다
				context.strokeStyle = '#000000' ;  //구분선은 검정, 일반선은 빨강
				context.lineWidth = 2 ;  //구분선은 두껍게 
				// 수직선을 그림 
				context.moveTo(i * CellSize + boardXYOffset, boardXYOffset);  //
				context.lineTo(i * CellSize + boardXYOffset, BoardSize * CellSize + boardXYOffset);
				
				// 수평선을 그림 
				context.moveTo(0.5, i * CellSize + boardXYOffset);
				context.lineTo(BoardSize * CellSize + boardXYOffset, i * CellSize + boardXYOffset);	
				context.stroke();
			}
		}
		
	}
	function drawBackground() {
		var context = canvas1.getContext('2d'); //2D 공간을 생성함 
		context.fillStyle = "#ffffff";
		context.fillRect(0, 0, canvas1.width, canvas1.height);
	}
	
	function drawCells() {
		var context = canvas1.getContext('2d'); 

		context.font = "12pt Calibri"; // small text
		context.textAlign = "center";
		context.textBaseline = "middle";
		var normalColor = "#aaaaaa";
		var singleColor = "#ff143c";
		
		
		var selectedColor = "#bbdefb";
		var sameDigitColor = "#c3d7ea";
		var crosslineColor = "#e2ebf3";
		// New if a digit is selected then make all cells with the same digit foreground red
		var selectCell = board1.getCell(new Location(selectRow, selectCol));
		var selectValue = selectCell.getValue();

		
		//배경 색칠 부분 
	
		var loc = new Location(selectRow,selectCol);
		var squareSibs = loc.squareSibs();
		
		for(let i=0; i<squareSibs.length;i++)
		{	
			var margin = 2;
			context.beginPath();
			context.rect(squareSibs[i].getCol() * CellSize, squareSibs[i].getRow() * CellSize, CellSize, CellSize);
			context.fillStyle = crosslineColor;
			context.fill()
		}
			
		
		// 선택한 셀의 배경을 칠함  
		for (var row = 0; row < BoardSize; row++)
			for (var col = 0; col < BoardSize; col++) {

				// Draw background of selected cell
				var cell = board1.getCell(new Location(row, col));
				var sameDigit = cell.getValue() == selectValue && selectValue != 0;
				
				if (row == selectRow && col == selectCol) {
					var margin = 2;
					context.beginPath();
					context.rect(col * CellSize+boardXYOffset, row * CellSize+boardXYOffset, CellSize, CellSize);
					context.fillStyle = selectedColor;
					context.fill()
				}else if (row == selectRow && col !=selectCol)
				{
					var margin = 2;
					context.beginPath();
					context.rect(col * CellSize+boardXYOffset, row * CellSize+boardXYOffset, CellSize, CellSize);
					context.fillStyle = crosslineColor;
					context.fill()
				}else if (row != selectRow && col ==selectCol)
				{
					var margin = 2;
					context.beginPath();
					context.rect(col * CellSize+boardXYOffset, row * CellSize+boardXYOffset, CellSize, CellSize);
					context.fillStyle = crosslineColor;
					context.fill()
				}else if(sameDigit)
				{
					var margin = 2;
					context.beginPath();
					context.rect(col * CellSize+boardXYOffset, row * CellSize+boardXYOffset, CellSize, CellSize);
					context.fillStyle = sameDigitColor;
					context.fill()
				}
			}
		context.fillStyle = "#999999"; // text color - light

		// 메모 작은숫자 생성 알고리즘 
		if (showAllowed)
			for (var row = 0; row < BoardSize; row++)
				for (var col = 0; col < BoardSize; col++) {
					var cell = board1.getCell(new Location(row, col));
					if (!cell.isAssigned()) { //할당이 되지 않았으면 
						var allowedValues = cell._allowed.allowedValuesArray(); //메모값을 가져와 출력한다.
						for (var i = 0; i < allowedValues.length; i++) {
							var val = allowedValues[i];
							var x = (col + 0.5) * CellSize; // center of cell for textAlign center, textBaseline middle
							var y = (row + 0.5) * CellSize;
							var subRow = Math.floor((val - 1) / 3) - 1;
							var subCol = Math.floor((val - 1) % 3) - 1;
							x += subCol * SubCellSize;
							y += subRow * SubCellSize;
							var hiddenSingle = allowedValues.length != 1 && val == cell.getAnswer(); // naked single would have only one allowed value
							context.fillStyle = normalColor; // show hidden single in purple
							if (showSingles && val == cell.getAnswer())
								context.fillStyle = singleColor; // show hidden single in purple
							context.fillText(val, x, y);
						}
					}
				}

		context.fillStyle = "#999999"; // text color - light
	
		//값 색칠 부분 
		context.font = "32pt Calibri";
		context.textAlign = "center";
		context.textBaseline = "middle";
		
		var normalForeColor = "#191929";
		var sameDigitForeColor = "#F91919";
		context.fillStyle = normalForeColor; // text color - dark
		for (var row = 0; row < BoardSize; row++)
			for (var col = 0; col < BoardSize; col++) {
				var cell = board1.getCell(new Location(row, col));
				var x = (col + 0.5) * CellSize; // center of cell for textAlign center, textBaseline middle
				var y = (row + 0.5) * CellSize+4;
				var sameDigit = cell.getValue() == selectValue && selectValue != 0;
				
				// 숫자를 작성 
				var value = cell.getValue();
				if (value != 0) {
					context.fillStyle = cell.isGiven() ? "#344861" : "#696969"; // show "givens" in a darker color
					//if (sameDigit)// 그리고 덮어 씌움     // 같은 숫자면 Digit배경을 바꿈 
					//	context.fillStyle = sameDigitForeColor; // text color - dark
					context.fillText(value, x, y);
				}
			}
	}

	function drawCanvas() {  //Canvas를 그림 
		canvas1.width = canvas1.width;
		drawBackground();
		drawCells();
		drawGrid();
	}
	
	
	function updateUI() {
		drawCanvas();
		//checkStatus();
		tbSerial.value = board1.toString(); //디버깅용인듯
	}
	
	function selectCell(row, col) {
		selectRow = row;
		selectCol = col;
		drawCanvas();
	}
	
	
	canvas1.onmousedown = function canvasMouseDown(ev) { // 캔버스 내부에서의 마우스 좌표를 구함 
		var coords = this.relMouseCoords(ev); 
		var row = Math.floor((coords.y-boardXYOffset) / CellSize);
		var col = Math.floor((coords.x-boardXYOffset) / CellSize);
		if(row < 9 && col < 9 && row >=0 && col >=0)
			selectCell(row, col);
	}
	
	function setDigitInCell(digit) {
		
		var cell = board1.getCell(new Location(selectRow, selectCol));
		//message.innerHTML = "";
		
		//if (cell.isGiven())
		//	return;

		//if (digit != 0 && !cell.isAllowed(digit)) {
			//message.innerHTML = "Digit not allowed";
			//return;
		//}
		//alert(1);
		//pushBoard(); //되돌리기 기록 
		cell.setValue(digit);
		//board1.updateAllowed();
		updateUI();
	}

	function moveSelection(row, col) {
		selectRow += row;
		selectCol += col;
		if (selectRow < 0)
			selectRow = 8;
		else if (selectRow > 8)
			selectRow = 0;
		if (selectCol < 0)
			selectCol = 8;
		else if (selectCol > 8)
			selectCol = 0;
		drawCanvas();
	}
	
	document.onkeydown = function (ev) {
		switch (ev.keyCode) {
			case 37: // left arrow
				moveSelection(0, -1);
				break;
			case 38: // up arrow
				moveSelection(-1, 0);
				ev.preventDefault();
				break;
			case 39: // right arrow
				moveSelection(0, 1);
				break;
			case 40: // down arrow
				moveSelection(1, 0);
				ev.preventDefault();
				break;
			default:
				
				var key = Number(ev.keyCode);
				var digit = key >= 96 ? key - 96 : key - 48;// handle keypad digits as well
				if (digit >= 0 && digit <= 9)
					setDigitInCell(digit);
				
				break;
		}
	}
	

	
	board1.setString("7.8...3.....2.1...5..7..2...4.....263.948...7...1...9..9.6....4....7.5....5......","7181113345672.1...5..7..2...4.....263.948...7...1...9..9.6....4....7.5....5......"); //보드 데이터 셋팅 
	
	drawCanvas();

	

		
		
		
	
		
	
	
	
	


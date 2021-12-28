	var canvas2 = document.getElementById("canvas2");					//캔버스2 숫자 버튼 
	
	//숫자 선택 판 
	var digCellSize = 120;
	var NumpadSize = 9;
	var NumpadXOffset = 10; 
	var NumpadYOffset = 180; 
	var prevMouseHoverRow=-1;
	var prevMouseHoverCol=-1;
	var mouseHoverRow = -1;
	var mouseHoverCol = -1;
	var isMouseDown = 0;

	// New stuff - draw a digit selector in canvas above board
	// 숫자 선택 모듈 

	function initDigitSource() {
		// Only ever called once!
		var context = canvas2.getContext('2d');
		context.clearRect(0, 0, canvas2.width, canvas2.height);


		// Shadow
		context.shadowColor = 'black';
		context.shadowBlur = 4;

		// Rectangle
		context.fillStyle = '#ffffff';
		context.fillRect(NumpadXOffset, NumpadYOffset, digCellSize * (NumpadSize/3), digCellSize * (NumpadSize/3));
		
		context.shadowBlur = 0;
		context.fillStyle = isMouseDown ? '#d3e3f3':'#f0f4f9';
		
		
		if (mouseHoverRow != -1 && mouseHoverCol != -1)
			context.fillRect(NumpadXOffset+digCellSize *mouseHoverCol , NumpadYOffset+digCellSize *mouseHoverRow, digCellSize , digCellSize);
			

		
		
		context.strokeStyle = '#eaeef4';
		for (var i = 0; i <= NumpadSize/3; i++) {
			context.beginPath();
			// Draw vertical lines
			context.lineWidth = 1;
			context.moveTo(NumpadXOffset+i * digCellSize, NumpadYOffset);
			context.lineTo(NumpadXOffset+i * digCellSize, NumpadYOffset+digCellSize * (NumpadSize/3));
			context.stroke();
		}
		for (var i = 0; i <= NumpadSize/3; i++) {
			context.beginPath();
			// Draw horizontal lines
			context.lineWidth = 1;
			context.moveTo(NumpadXOffset,NumpadYOffset+i*digCellSize);
			context.lineTo(NumpadXOffset+digCellSize*(NumpadSize/3),NumpadYOffset+i*digCellSize);
			context.stroke();
		}
		context.font = "33pt Calibri";
		context.textAlign = "center";
		context.textBaseline = "middle";
		var normalForeColor = "#0069d2";
		context.fillStyle = normalForeColor; // text color - dark
		for (var col = 0; col < NumpadSize; col++) {  
			var x = ((col%3) + 0.5) * digCellSize+NumpadXOffset; // center of cell for textAlign center, textBaseline middle
			var y = (Math.floor(col/3) + 0.5) * digCellSize+NumpadYOffset;
			var value = col < 9 ? col + 1 : "Del";
			context.fillStyle = normalForeColor; // show "givens" in a darker color
			context.fillText(value, x, y);
		}
	}
	
	canvas2.onmousedown = function canvasMouseDown(ev) {
		//var x = ev.pageX - this.offsetLeft;
		//var y = ev.pageY - this.offsetTop;
		isMouseDown = 1;	
		
		var coords = this.relMouseCoords(ev);
		var row = Math.floor((coords.y-NumpadYOffset) / digCellSize);
		var col = Math.floor((coords.x-NumpadXOffset) / digCellSize);
		var dig = row*3 + col+ 1;	
		if(row < 3 && col < 3 && row >=0 && col >=0)
			{
			mouseHoverRow = row;
			mouseHoverCol = col;
			initDigitSource();
			setDigitInCell(dig);
		}
		else
		{
			isMouseDown = 0;
			initDigitSource();
			mouseHoverCol = -1;
			mouseHoverRow = -1;
		}
		
	}
	
	canvas2.onmouseup = function canvasMouseUp(ev) {
		//var x = ev.pageX - this.offsetLeft;
		//var y = ev.pageY - this.offsetTop;
		isMouseDown = 0;
		var coords = this.relMouseCoords(ev);
		var row = Math.floor((coords.y-NumpadYOffset) / digCellSize);
		var col = Math.floor((coords.x-NumpadXOffset) / digCellSize);
		var dig = row*3 + col+ 1;	
		if(row < 3 && col < 3 && row >=0 && col >=0)
		{
			mouseHoverRow = row;
			mouseHoverCol = col;
		}
		else
		{
			mouseHoverRow = -1;
			mouseHoverCol = -1;
		}
		
		initDigitSource();
		
		}
	
	
	canvas2.onmousemove = function mouseMove(ev) {
		//var x = ev.pageX - this.offsetLeft;
		//var y = ev.pageY - this.offsetTop;
		var coords = this.relMouseCoords(ev);
		
		var row = Math.floor((coords.y-NumpadYOffset) / digCellSize);
		var col = Math.floor((coords.x-NumpadXOffset) / digCellSize);	
	
		if(row < 3 && col < 3 && row >=0 && col >=0)
		{
			mouseHoverRow = row;
			mouseHoverCol = col;
		}
		else
		{
			isMouseDown = 0;
			mouseHoverRow = -1;
			mouseHoverCol = -1;
		}	
		
		if(prevMouseHoverRow != mouseHoverRow || prevMouseHoverCol != mouseHoverCol)
			initDigitSource();

			
		prevMouseHoverRow = mouseHoverRow;
		prevMouseHoverCol = mouseHoverCol;
		
	}
		
	initDigitSource();
	

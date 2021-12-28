	var canvas2 = document.getElementById("canvas2");					//캔버스2 숫자 버튼 
	
	//숫자 선택 판 
	var digCellSize = 103;
	var NumpadSize = 9;
	var NumpadXOffset = 5; 
	var NumpadYOffset = 142; 
	var prevMouseHoverRow=-1;
	var prevMouseHoverCol=-1;
	var mouseHoverRow = -1;
	var mouseHoverCol = -1;
	var isMouseDown = 0;
	var gisMouseDown = 0;
	var buttons;
	var gMouseX = 0;
	var gMouseY = 0;

	// New stuff - draw a digit selector in canvas above board
	// 숫자 선택 모듈 
	
	
	function drawButtons() {
		var context = canvas2.getContext('2d');
			// Shadow
		context.shadowColor = '#847daa';

		if (buttons.length==0)
			return
			
		// 걍 버튼 직사각형으로 다 구현 함 
		for(var i=0 ; i<buttons.length;i++)
		{
		var btn = buttons[i];

		//console.log(gMouseX,gMouseY);
				
		if(i==2 && memoEnable==true)
		{	
			context.fillStyle = '#ff0000';
			context.fillRect(btn.x-2, btn.y-2, btn.w+4, btn.h+4);
		}
			
		context.shadowBlur = 4;
		context.fillStyle = '#ffffff';
		if(btn.isHover(gMouseX,gMouseY)==1)
		{
			

			context.fillStyle = gisMouseDown ? '#eae7f9':'#f4f2fe';

		}
		
		if((i==3) && (hintCount <= 0))
		{
			context.fillStyle = '#8681a6'
		}	
		
		context.fillRect(btn.x, btn.y, btn.w, btn.h);
		context.shadowBlur = 0;
		
		if(btn.isUseImg == 1)
			btn.imgwrap.drawImage(canvas2);
		if(i==4)
		{
			context.font = "25pt Calibri";
			context.textAlign = "center";
			context.textBaseline = "middle";
			context.fillStyle = '#54469f'; // show "givens" in a darker color
			context.fillText('New Game', btn.x+btn.w/2+20, btn.y+btn.h/2+1);
		}
		
		if(i==3)
		{
			context.font = "13pt Calibri";
			context.textAlign = "center";
			context.textBaseline = "middle";
			context.fillStyle = '#8681a6'; // show "givens" in a darker color
			context.fillText(hintCount, btn.x+btn.w-12, btn.y+btn.h-12);
		
		}		
		//context.fillStyle = isMouseDown ? '#d3e3f3':'#f0f4f9';
		}
	}
	
	function drawDigitSource() {
		// Only ever called once!
		var context = canvas2.getContext('2d');
		context.clearRect(0, 0, canvas2.width, canvas2.height);
		drawButtons();

		// Shadow
		context.shadowColor = '#847daa';
		context.shadowBlur = 4;

		// Rectangle
		context.fillStyle = '#ffffff';
		context.fillRect(NumpadXOffset, NumpadYOffset, digCellSize * (NumpadSize/3), digCellSize * (NumpadSize/3));
		
		context.shadowBlur = 0;
		context.fillStyle = isMouseDown ? '#eae7f9':'#f4f2fe';
		//context.fillStyle = isMouseDown ? '#d3e3f3':'#f0f4f9';
		
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
		//var selectedColor = "#dad5f3";
		//var sameDigitColor = "#c4bcea";
		//var crosslineColor = "#f4f2fe";
		var normalForeColor = "#54469f";
		context.fillStyle = normalForeColor; // text color - dark
		for (var col = 0; col < NumpadSize; col++) {  
			var x = ((col%3) + 0.5) * digCellSize+NumpadXOffset; // center of cell for textAlign center, textBaseline middle
			var y = (Math.floor(col/3) + 0.5) * digCellSize+NumpadYOffset;
			var value = col < 9 ? col + 1 : "Del";
			context.fillStyle = normalForeColor; // show "givens" in a darker color
			context.fillText(value, x, y);
		}
	}
	

	function ImageWrap(src,imgWidth,imgHeight,imgX,imgY){
		
		this.img = new Image();
		this.img.src = src;
		this.imgHeight = imgHeight;
		this.imgWidth = imgWidth;
		this.imgX = imgX;
		this.imgY = imgY;
		
	}
	
	ImageWrap.prototype.drawImage= function(cvs){
		
		var ctx = cvs.getContext('2d');
        ctx.drawImage(this.img, this.imgX, this.imgY, this.imgHeight, this.imgWidth);
		
	}
	
	
	var AlignType = { "None": 0, "Center": 1, "Left" : 2, "Right" : 3}; //걍 원형은 시간이 없어서 안만듬
	var ShapeType = { "Circle": 0, "Rect": 1}; //걍 원형은 시간이 없어서 안만듬
	function Button(x,y,w,h,isUseImg, imgwrap, imgAlign){
		this.x = x;
		this.y = y;
		this.w = w;
		this.h = h;
		this.isUseImg = isUseImg;
		this.imgwrap = imgwrap;
		this.imgAlign= imgAlign;
		if(isUseImg==1)
		{
			if(this.imgAlign == AlignType.Center)
			{
				this.imgwrap.imgX = this.x + this.w/2 - this.imgwrap.imgWidth /2;
				this.imgwrap.imgY = this.y + this.h/2 - this.imgwrap.imgHeight /2;
			}	
			else if (this.imgAlign == AlignType.Left)
			{
				this.imgwrap.imgX = this.x + 20;
				this.imgwrap.imgY = this.y + this.h/2 - this.imgwrap.imgHeight /2;
			}	
		}
	
	}

	Button.prototype.isHover = function(mouseX,mouseY)
	{
		/*
		if(this.shape==ShapeType.Circle)
		{
			var centerX=this.x+this.w/2;
			var centerY=this.y+this.h/2;
			var r = this.x+this.w/2;
			if(Math.sqrt(Math.pow((centerX-mouseX),2)+Math.pow((centerY-mouseY),2))< r) 
			{ //원안에 마우스가 존재한다면 
				return 1;
			}
			return 0;
		}else
		*/
			var x1=this.x;
			var y1=this.y;
			var x2=this.x+this.w;
			var y2=this.y+this.h;
			if((x1<mouseX)&&(x2>mouseX)&&(y1<mouseY)&&(y2>mouseY))
			{ 
				return 1;
			}
			return 0;

	}
		canvas2.onmousedown = function canvasMouseDown(ev) {
		//var x = ev.pageX - this.offsetLeft;
		//var y = ev.pageY - this.offsetTop;
		var coords = this.relMouseCoords(ev);
		isMouseDown = 1;	
		gisMouseDown = 1;
		gMouseX = coords.x;
		gMouseY = coords.y;
		var coords = this.relMouseCoords(ev);
		var row = Math.floor((coords.y-NumpadYOffset) / digCellSize);
		var col = Math.floor((coords.x-NumpadXOffset) / digCellSize);
		var dig = row*3 + col+ 1;	
		if(row < 3 && col < 3 && row >=0 && col >=0)
		{
			mouseHoverRow = row;
			mouseHoverCol = col;
			drawDigitSource();
			setDigitInCell(dig);
		}
		else
		{
			isMouseDown = 0;
			drawDigitSource();
			mouseHoverCol = -1;
			mouseHoverRow = -1;
		}
		
		if(buttons[0].isHover(gMouseX,gMouseY)==1)
		{	
			undo();
		}
		if(buttons[1].isHover(gMouseX,gMouseY)==1)
		{	
			deleteCell();
			
		}
		if(buttons[2].isHover(gMouseX,gMouseY)==1)
		{	
			toggleMemo();
		}
		if(buttons[3].isHover(gMouseX,gMouseY)==1)
		{	
			callHint();
		}
		if(buttons[4].isHover(gMouseX,gMouseY)==1)
		{	
			isInit = confirm("게임을 초기화 하시겠습니까?");
			if(isInit)
			{
					init_game();
			}
		
		}
		
	}
	canvas2.onmouseup = function canvasMouseUp(ev) {
		//var x = ev.pageX - this.offsetLeft;
		//var y = ev.pageY - this.offsetTop;
		var coords = this.relMouseCoords(ev);
		gMouseX = coords.x;
		gMouseY = coords.y;
		isMouseDown = 0;
		gisMouseDown=0;
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
		
		drawDigitSource();
		
		}
	
	
	canvas2.onmousemove = function mouseMove(ev) {
		//var x = ev.pageX - this.offsetLeft;
		//var y = ev.pageY - this.offsetTop;
		var coords = this.relMouseCoords(ev);
		
		gMouseX = coords.x;
		gMouseY = coords.y;
		
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
			drawDigitSource();
		
		drawDigitSource();	
		prevMouseHoverRow = mouseHoverRow;
		prevMouseHoverCol = mouseHoverCol;
		
	}	
	
	buttons = new Array();
	var btn_w = 68;
	var btn_h = 62;
	var btn_y = 70;
	

	
	var imgwrap0 = new ImageWrap('/term/images/sudoku1.svg',50,50,0,0);
	var imgwrap1 = new ImageWrap('/term/images/sudoku2.svg',50,50,0,0);
	var imgwrap2 = new ImageWrap('/term/images/sudoku3.svg',50,50,0,0);
	var imgwrap3 = new ImageWrap('/term/images/sudoku4.svg',50,50,0,0);
	var imgwrap4 = new ImageWrap('/term/images/logo.svg',50,50,0,0);

	
		//buttons.push(new Button(5,55,btn_wh,btn_wh,1,'/term/images/logo.svg'));
	buttons.push(new Button(5,btn_y,btn_w,btn_h,true,imgwrap0,AlignType.Center)); 
	buttons.push(new Button(85,btn_y,btn_w,btn_h,true,imgwrap1,AlignType.Center));
	buttons.push(new Button(165,btn_y,btn_w,btn_h,true,imgwrap2,AlignType.Center));
	buttons.push(new Button(245,btn_y,btn_w,btn_h,true,imgwrap3,AlignType.Center));
	buttons.push(new Button(5,1,308,60,true,imgwrap4,AlignType.Left));
	//console.log(buttons[4]);
	
	imgwrap0.img.onload = function () {  //미리 이미지를 로드함 
        //draw background image
		imgwrap0.drawImage(canvas2);
    };
	imgwrap1.img.onload = function () {  //미리 이미지를 로드함 
        //draw background image
		imgwrap1.drawImage(canvas2);
    };
	imgwrap2.img.onload = function () {  //미리 이미지를 로드함 
        //draw background image
		imgwrap2.drawImage(canvas2);
    };
	imgwrap3.img.onload = function () {  //미리 이미지를 로드함 
        //draw background image
		imgwrap3.drawImage(canvas2);
    };

	imgwrap4.img.onload = function () {  //미리 이미지를 로드함 
        //draw background image
		imgwrap4.drawImage(canvas2);
    };

	
	drawDigitSource();
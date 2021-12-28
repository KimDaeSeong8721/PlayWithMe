function Sudoku(N,K) {   //보드는 어레이와 Cell로 이루어진 것임 

		function MultiDimArray(rows, cols) {
			var a = new Array(rows);
			for (var i = 0; i < rows; i++) {
				a[i] = new Array(cols);
				for (var j = 0; j < cols; j++)
					a[i][j] = 0;
			}
			return a;
		}
		this.N =N;
		this.K =K;
		var SRNd = Math.sqrt(N);
		this.SRN = Math.round(SRNd); //3
		//console.log(this.SRN);
		

		this.mat = MultiDimArray(N, N);
		
	}
	
Sudoku.prototype.fillValues = function(){
	this.fillDiagonal();
	     // Fill remaining blocks
     this.fillRemaining(0, this.SRN);
 
        // Remove Randomly K digits to make game
     this.removeKDigits();
}
	
Sudoku.prototype.fillDiagonal = function(){
	   for (var i = 0; i<this.N; i=i+this.SRN)
            // for diagonal box, start coordinates->i==j
            this.fillBox(i, i);
}

Sudoku.prototype.unUsedInBox = function(rowStart,colStart,num){
    
        for (var i = 0; i<this.SRN; i++)
            for (var j = 0; j<this.SRN; j++)
                if (this.mat[rowStart+i][colStart+j]==num)
                    return false;
 
        return true;
    
}

Sudoku.prototype.fillBox = function(row,col){
        var num;
        for (var i=0; i<this.SRN; i++)
        {
            for (var j=0; j<this.SRN; j++)
            {
                do
                {
                    num = this.randomGenerator(this.N);
                }
                while (!this.unUsedInBox(row, col, num));
 
                this.mat[row+i][col+j] = num;
            }
        }
    }
 
 // Random generator
Sudoku.prototype.randomGenerator = function(num)
    {
        return Math.floor((Math.random()*num+1));
    }
 
    // Check if safe to put in cell
Sudoku.prototype.CheckIfSafe = function(i,j,num)
    {
        return (this.unUsedInRow(i, num) &&
                this.unUsedInCol(j, num) &&
                this.unUsedInBox(i-i%this.SRN, j-j%this.SRN, num));
    }
 
    // check in the row for existence
Sudoku.prototype.unUsedInRow = function(i,num)
    {
        for (var j = 0; j<this.N; j++)
           if (this.mat[i][j] == num)
                return false;
        return true;
    }
 
    // check in the row for existence
Sudoku.prototype.unUsedInCol = function(j,num)
    {
        for (var i = 0; i<this.N; i++)
            if (this.mat[i][j] == num)
                return false;
        return true;
    }
 
    // A recursive function to fill remaining
    // matrix
Sudoku.prototype.fillRemaining = function(i, j)
    {
        //  System.out.prvarln(i+" "+j);
        if (j>=this.N && i<this.N-1)
        {
            i = i + 1;
            j = 0;
        }
        if (i>=this.N && j>=this.N)
            return true;
 
        if (i < this.SRN)
        {
            if (j < this.SRN)
                j = this.SRN;
        }
        else if (i < this.N-this.SRN)
        {
            if (j==(Math.floor(i/this.SRN)*this.SRN)) //의심되는부분
                j =  j + this.SRN;
        }
        else
        {
            if (j == this.N-this.SRN)
            {
                i = i + 1;
                j = 0;
                if (i>=this.N)
                    return true;
            }
        }
 
        for (var num = 1; num<=this.N; num++)
        {
            if (this.CheckIfSafe(i, j, num))
            {
                this.mat[i][j] = num;
                if (this.fillRemaining(i, j+1))
                    return true;
 
                this.mat[i][j] = 0;
            }
        }
        return false;
    }
 
    // Remove the K no. of digits to
    // complete game
Sudoku.prototype.removeKDigits = function()
    {
        var count = this.K;
        while (count != 0)
        {
            var cellId = this.randomGenerator(this.N*this.N)-1;
 
            // System.out.prvarln(cellId);
            // extract coordinates i  and j
            var i = Math.floor(cellId/this.N);
            var j = cellId%9;
            if (j != 0)
                j = j - 1;
 			//console.log(i +' , '+ j);
            // System.out.prvarln(i+" "+j);
            if (this.mat[i][j] != 0)
            {
                count--;
                this.mat[i][j] = 0;
            }
        }
    }
 
    // Print sudoku
Sudoku.prototype.printSudoku = function()
    {
        for (var i = 0; i<this.N; i++)
        {
			var str='';
            for (var j = 0; j<this.N; j++)
                str+=(this.mat[i][j] + " ");
            console.log(str);
        }
        console.log();
    }

var sudo = new Sudoku(9,0);
sudo.fillValues();
sudo.printSudoku();
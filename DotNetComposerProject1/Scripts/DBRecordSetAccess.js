/**************** START DATA ACCESS FUNCTIONS *******************/

function Cursor (DBRecords, DBColumnNames) {
	this.columns = DBColumnNames;
	// this.columns = ["quote_value","company_name","stock_symbol","quote_datetime"];
	this.dataArray = DBRecords;
	// this.dataArray = [["19.44","CORP1","CRP1      ","2009-01-01 00:00:00.0"],["12.20","CORP2","CRP2      ","2009-01-01 00:00:00.0"],["307.65","CORP3","CRP3      ","2009-01-01 00:00:00.0"],["3.82","CORP4","CRP4      ","2009-01-01 00:00:00.0"],["17.73","CORP5","CRP5      ","2009-01-01 00:00:00.0"]];
	this.recordCount = this.dataArray.length;
	this.currentRecordNumber = -1;
	this.currentRecord = new Object();
	
	// methods
	this.isAvailable = isAvailable;
	this.fetchFirst = fetchFirst;
	this.fetchNext = fetchNext;
	this.fetchPrevious = fetchPrevious;
	this.fetchLast = fetchLast;
	this.fetchRecord = fetchRecord;
}

function isAvailable (recNumber) {
	if (recNumber <= this.dataArray.length) {
		return true;
	} else {
		return false;
	}
}

function fetchFirst () {
	return this.fetchRecord (1); 
}

function fetchLast () {
	return this.fetchRecord (this.recordCount); 
}

function fetchPrevious () {
	return this.fetchRecord(this.currentRecordNumber - 1);
}

function fetchNext () {
	return this.fetchRecord(this.currentRecordNumber + 1);
}

function fetchRecord (recNumber) {
	if (this.isAvailable(recNumber)) {
		this.currentRecordNumber = recNumber;
		
		for (var colIndex = 0; colIndex < this.columns.length; colIndex++) {
			this.currentRecord[this.columns[colIndex]] = this.dataArray[this.currentRecordNumber-1][colIndex];
		}
		return this.currentRecord; 
	} else {
		return undefined;
	}
}

/**************** END DATA ACCESS FUNCTIONS *******************/

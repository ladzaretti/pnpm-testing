// Code generated by "stringer -type=Status,StatusCategory -output=status_errorstring.go -linecomment"; DO NOT EDIT.

package apdu

import "strconv"

func _() {
	// An "invalid array index" compiler error signifies that the constant values have changed.
	// Re-run the stringer command to generate them again.
	var x [1]struct{}
	_ = x[StatusNoFurtherQualification-36864]
	_ = x[StatusWarningNonVolatileMemoryUnchangedNoInformation-25090]
	_ = x[StatusWarningNonVolatileMemoryUnchangePartOfReturnedDataCorrupted-25217]
	_ = x[StatusWarningNonVolatileMemoryUnchangeEndOfFileOrRecordReachedPrematurely-25218]
	_ = x[StatusWarningNonVolatileMemoryUnchangeSelectedFileDeactivated-25219]
	_ = x[StatusWarningNonVolatileMemoryUnchangeFileControlInvalid-25220]
	_ = x[StatusWarningNonVolatileMemoryUnchangeFileTerminated-25221]
	_ = x[StatusWarningNonVolatileMemoryUnchangeNoInputDataFromSensor-25222]
	_ = x[StatusWarningNonVolatileMemoryChangedNoInformation-25344]
	_ = x[StatusWarningNonVolatileMemoryChangedFileFull-25473]
	_ = x[StatusErrorWrongLength-26368]
	_ = x[StatusErrorWrongParameters-27392]
	_ = x[StatusErrorUnsupportedInstructionCode-27904]
	_ = x[StatusErrorUnsupportedClass-28160]
	_ = x[StatusErrorUnknown-28416]
}

const (
	_Status_name_0 = "Warning: state of non-volatile memory has not changed: No reason given"
	_Status_name_1 = "Warning: state of non-volatile memory has not changed: Part of returned data may be corruptedWarning: state of non-volatile memory has not changed: End of file or record reached before reading Ne bytesWarning: state of non-volatile memory has not changed: Selected file deactivatedWarning: state of non-volatile memory has not changed: File control information not formatted correctlyWarning: state of non-volatile memory has changed: Selected file in termination stateWarning: state of non-volatile memory has not changed: No input data available from a sensor on the card"
	_Status_name_2 = "Warning: state of non-volatile memory has changed: No reason given"
	_Status_name_3 = "Warning: state of non-volatile memory has changed: File filled up by the last write"
	_Status_name_4 = "Error: \"wrong length; no further indication\""
	_Status_name_5 = "Error: \"Wrong parameters P1-P2\""
	_Status_name_6 = "Error: \"Instruction code not supported or invalid\""
	_Status_name_7 = "Error: \"Class not supported\""
	_Status_name_8 = "Error: \"No precise diagnosis\""
	_Status_name_9 = "No further qualification"
)

var (
	_Status_index_1 = [...]uint16{0, 93, 201, 281, 384, 469, 573}
)

func (i Status) Error() string {
	switch {
	case i == 25090:
		return _Status_name_0
	case 25217 <= i && i <= 25222:
		i -= 25217
		return _Status_name_1[_Status_index_1[i]:_Status_index_1[i+1]]
	case i == 25344:
		return _Status_name_2
	case i == 25473:
		return _Status_name_3
	case i == 26368:
		return _Status_name_4
	case i == 27392:
		return _Status_name_5
	case i == 27904:
		return _Status_name_6
	case i == 28160:
		return _Status_name_7
	case i == 28416:
		return _Status_name_8
	case i == 36864:
		return _Status_name_9
	default:
		return "Status(" + strconv.FormatInt(int64(i), 10) + ")"
	}
}
func _() {
	// An "invalid array index" compiler error signifies that the constant values have changed.
	// Re-run the stringer command to generate them again.
	var x [1]struct{}
	_ = x[StatusBytesAvailable-97]
	_ = x[StatusWarningNonVolatileMemoryUnchanged-98]
	_ = x[StatusWarningNonVolatileMemoryChanged-99]
	_ = x[StatusErrorNonVolatileMemoryUnchanged-100]
	_ = x[StatusErrorNonVolatileMemoryChanged-101]
	_ = x[StatusErrorSecurityIssue-102]
	_ = x[StatusErrorFunctionUnsupported-104]
	_ = x[StatusErrorCommandNotAllowed-105]
	_ = x[StatusErrorWrongParametersWithInfo-106]
	_ = x[StatusErrorWrongLe-108]
}

const (
	_StatusCategory_name_0 = "SW2 encodes the number of data bytes still availableWarning: state of non-volatile memory is unchanged (further qualification in SW2)Warning: state of non-volatile memory has changed (further qualifications in SW2)Error: state of non-volatile memory is unchanged (further qualification in SW2)Error: state of non-volatile memory has changed (further qualifications in SW2)Error: \"security related issues\""
	_StatusCategory_name_1 = "Error: \"Functions in CLA not supported (further qualification in SW2)\"Error: \"Command not allowed (further qualification in SW2)\"Error: \"Wrong parameters P1-P2 (further qualification in SW2)\""
	_StatusCategory_name_2 = "Error: \"Wrong Le field: SW2 encodes the exact number of available data bytes\""
)

var (
	_StatusCategory_index_0 = [...]uint16{0, 52, 133, 214, 293, 372, 404}
	_StatusCategory_index_1 = [...]uint8{0, 70, 129, 191}
)

func (i StatusCategory) Error() string {
	switch {
	case 97 <= i && i <= 102:
		i -= 97
		return _StatusCategory_name_0[_StatusCategory_index_0[i]:_StatusCategory_index_0[i+1]]
	case 104 <= i && i <= 106:
		i -= 104
		return _StatusCategory_name_1[_StatusCategory_index_1[i]:_StatusCategory_index_1[i+1]]
	case i == 108:
		return _StatusCategory_name_2
	default:
		return "StatusCategory(" + strconv.FormatInt(int64(i), 10) + ")"
	}
}

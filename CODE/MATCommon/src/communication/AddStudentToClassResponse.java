package communication;

public class AddStudentToClassResponse extends Message {
	
private static final long serialVersionUID = 1L;

	boolean isSucceeded;
	String requestId;	
	private String errText;

	public AddStudentToClassResponse(boolean isSucceeded, String errText) {	
		this.isSucceeded = isSucceeded;
		this.errText = errText;
	}
	
	public Boolean actionSucceed(){	
		return isSucceeded;
	}	
	public String getErrText() {
		return errText;
	}

}

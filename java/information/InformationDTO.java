package information;

public class InformationDTO {
	
	private float[] latitude; //위도
	private float longtitude; //경도
	private String dept_name;
	public float[] getLatitude() {
		return latitude;
	}
	public void setLatitude(float[] latitude) {
		this.latitude = latitude;
	}
	public float getLongtitude() {
		return longtitude;
	}
	public void setLongtitude(float longtitude) {
		this.longtitude = longtitude;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public InformationDTO(float[] latitude, float longtitude, String dept_name) {
		super();
		this.latitude = latitude;
		this.longtitude = longtitude;
		this.dept_name = dept_name;
	}

}

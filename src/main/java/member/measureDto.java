package member;

public class measureDto {
	
	String id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMeasure_date() {
		return measure_date;
	}
	public void setMeasure_date(String measure_date) {
		this.measure_date = measure_date;
	}
	public String getFolderpath() {
		return folderpath;
	}
	public void setFolderpath(String folderpath) {
		this.folderpath = folderpath;
	}
	public String getArch() {
		return arch;
	}
	public void setArch(String arch) {
		this.arch = arch;
	}
	public String getHeel() {
		return heel;
	}
	public void setHeel(String heel) {
		this.heel = heel;
	}
	public String getAdmin_send() {
		return admin_send;
	}
	public void setAdmin_send(String admin_send) {
		this.admin_send = admin_send;
	}
	String measure_date;
	String folderpath;
	String arch;
	String heel;
	String admin_send;

}

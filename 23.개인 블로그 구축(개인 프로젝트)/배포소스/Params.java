/**
 * 여러개의 요청파라메터들을 저장(포장)하기 위한 JavaBean
 * {사용자 선택페이지, 검색유형, 검색값, 한페이지에 출력하는 행의 갯수, 페이지 번호 등}
 *  
 * @author 김기정
 */
public class Params {
	private int page;         /** 사용자 요청 페이지 */
	private String type;      /** 사용자 검색 유형 */
	private String value;     /** 사용자 검색 값 */
	private int pageSize;     /** 페이지에 출력할 행의 수 */
	private int pageNum;      /** 페이지에 출력할 페이지 수 */
	
	public Params() {
		this(1, null, null, 10, 10);
	}
	
	public Params(int page, String type, String value, int pageSize, int pageNum) {
		this.page = page;
		this.type = type;
		this.value = value;
		this.pageSize = pageSize;
		this.pageNum = pageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getValue() {
		return value;
	}
	
	public void setValue(String value) {
		this.value = value;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		if(pageSize < 0 || pageSize > 50){
			this.pageSize = 10;
			return;
		}
		this.pageSize = pageSize;
	}
	

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		if(pageNum < 0 || pageNum > 20){
			this.pageNum = 10;
			return;
		}
		this.pageNum = pageNum;
	}

	@Override
	public String toString() {
		return "Params [page=" + page + ", type=" + type + ", value=" + value + ", pageSize=" + pageSize + ", pageNum="
				+ pageNum + "]";
	}
	
}

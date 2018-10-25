/**
 * ����¡ ��� �� ������ ��ȣ(1|2|3|4|5....) ����� ������ JSP���� ó������ �ʰ�,
 * ������ �� �ֵ��� ��ƿ��Ƽ Ŭ���� ����
 * @author �����
 */
public class PageBuilder {
	
	private Params params;            /** ��û �Ķ���� */
	
	private int totalRowCount;        /** ���̺�κ��� �˻��� ���� �� */
	private int totalPageCount;       /** ���꿡 ���� ��ü������ �� */
	private int listNo;               /** ��� ��ȣ */
	private int currentStartPage;     /** ���� ����� ���������� ��ȣ */
	private int currentEndPage;       /** ���� ����� ������������ ��ȣ */
	private int previousStartPage;    /** ���� ����� ���������� ��ȣ */
	private int nextStartPage;        /** ���� ����� ���������� ��ȣ */
	
	
	public PageBuilder() {
		this(null, 0);
	}
	
	/**
	 * @param params           ��û �Ķ����
	 * @param totalRowCount    �˻�Ÿ�Ժ� �˻��� ���� ��
	 */
	public PageBuilder(Params params, int totalRowCount ) {
		this.params = params;
		this.totalRowCount = totalRowCount;
	}

	public Params getParams() {
		return params;
	}

	public void setParams(Params params) {
		this.params = params;
	}

	public int getTotalRowCount() {
		return totalRowCount;
	}

	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getListNo() {
		return listNo;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}
	
	public int getCurrentStartPage() {
		return currentStartPage;
	}

	public void setCurrentStartPage(int currentStartPage) {
		this.currentStartPage = currentStartPage;
	}

	public int getCurrentEndPage() {
		return currentEndPage;
	}

	public void setCurrentEndPage(int currentEndPage) {
		this.currentEndPage = currentEndPage;
	}

	public int getPreviousStartPage() {
		return previousStartPage;
	}

	public void setPreviousStartPage(int previousStartPage) {
		this.previousStartPage = previousStartPage;
	}

	public int getNextStartPage() {
		return nextStartPage;
	}

	public void setNextStartPage(int nextStartPage) {
		this.nextStartPage = nextStartPage;
	}

	@Override
	public String toString() {
		return "PageBuilder [params=" + params + ", totalRowCount=" + totalRowCount + ", totalPageCount="
				+ totalPageCount + ", listNo=" + listNo + ", currentStartPage=" + currentStartPage + ", currentEndPage="
				+ currentEndPage + ", previousStartPage=" + previousStartPage + ", nextStartPage=" + nextStartPage
				+ "]";
	}

	/** ����¡ ��� */
	public void build(){
		// DB�κ��� �˻��� ���� ���� ���� ��ü�������� ���
		totalPageCount = (int)Math.ceil((double)totalRowCount / params.getPageSize());
		
		// ��Ϻ� ��ȣ
		listNo = (params.getPage() - 1) / params.getPageNum();
		//(1~5): 0, (6~10): 1, (11~15): 2, .....
		
		// ���� ����� ������������ȣ�� ��������������ȣ ���
		currentStartPage = (listNo * params.getPageNum()) + 1;
		currentEndPage = (listNo * params.getPageNum()) + params.getPageNum();
		
		/*
		if (currentStartPage > totalPageCount){
			currentStartPage = currentStartPage - params.getPageNum() + 1;
		}
		*/
		if (currentEndPage > totalPageCount){
			currentEndPage = totalPageCount;
		}
		
		// ���� ����� ���������� ��ȣ ���
		previousStartPage = currentStartPage - params.getPageNum();
		// ù��° ����� ��� 1�������� ����
		if (previousStartPage < 0)  previousStartPage = 1;
		
		// ���� ����� ���������� ��ȣ ���
		nextStartPage = currentStartPage + params.getPageNum();
	}
	
	/** ���� ��Ͽ��� [ó������] ��� ���� ��ȯ */
	public boolean isShowFirst() {
		return listNo > 0;
	}
	
	/** ���� ��Ͽ��� [������] ��� ���� ��ȯ */
	public boolean isShowLast() {
		return currentEndPage < totalPageCount;
	}
	
	/** ���� ��Ͽ��� [�������] ��� ���� ��ȯ */
	public boolean isShowPrevious() {
		return listNo > 0;
	}
	
	/** ���� ��Ͽ��� [�������] ��� ���� ��ȯ */
	public boolean isShowNext() {
		return currentEndPage < totalPageCount;
	}
	
	/** ���� ������Ʈ�� ��ȯ */
	public String getQueryString(int page) {
		String queryString = "?page=" + page;
		// ���ǰ˻��� �ִ� ���
		queryString += params.getType() != null ? "&type=" + params.getType() + "&value=" + params.getValue()  :  "";
		return queryString;
	}
	
	
	/** �׽�Ʈ�� ���� main */
	public static void main(String[] args) {
		/** ����� ����������, �˻�����, �˻���, �������� ����� ���� ��, ������ ��, ���̺��� �˻��� ���� �� */
		Params params = new Params(1, null, null, 10, 10);
		int selectCount = 156;
		PageBuilder pageBuilder = new PageBuilder(params, selectCount);
		pageBuilder.build();
		
		System.out.println("�˻��� ���: " + pageBuilder.getTotalRowCount());
		System.out.println("��û������: " + pageBuilder.getParams().getPage());
		
		System.out.println("��ü��������: " + pageBuilder.getTotalPageCount());
		
		System.out.println("�������� ����������: " + pageBuilder.getCurrentStartPage());
		System.out.println("�������� ��������: " + pageBuilder.getCurrentEndPage());
		
		System.out.println("ó������ �����ֱ� ����: " + pageBuilder.isShowFirst());
		System.out.println("������� �����ֱ� ����: " + pageBuilder.isShowPrevious());
		
		System.out.println("������� �����ֱ� ����: " + pageBuilder.isShowNext());
		System.out.println("������ �����ֱ� ����: " + pageBuilder.isShowLast());
		
		// JSP���� ������ ��ȣ ���� ��� ��		
		for(int i=pageBuilder.getCurrentStartPage(); i<=pageBuilder.getCurrentEndPage(); i++){
			System.out.print(i + " | ");
		}
		System.out.println();
		
		
		System.out.println("-----------------------------------------------");
		
		// �̸����� �˻� ��
		Params searchParams = new Params(1, "name", "�����", 10, 10);
		int searchCount = 11;
		PageBuilder pageBuilder2 = new PageBuilder(searchParams, searchCount);
		pageBuilder2.build();
		System.out.println("�˻��� ���: " + pageBuilder2.getTotalRowCount());
		System.out.println("��û������: " + pageBuilder2.getParams().getPage());
		
		System.out.println("��ü��������: " + pageBuilder2.getTotalPageCount());
		
	}
}

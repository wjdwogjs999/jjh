package member.bean;

public class MemberPaging {
	
	public String makePagingHTML(int pg, int pageBlock, int pageSize,int totalA){
		StringBuffer pagingHTML = new StringBuffer();
		
		int currentPage = pg;
				
		int totalP=(totalA+pageSize-1)/pageSize;
		
		int startPage=((int)((currentPage-1)/pageBlock))*pageBlock+1;
		
		int endPage=startPage+pageBlock-1;
		
		if(endPage>totalP){
			endPage=totalP;
		}
		
		if(startPage>pageBlock){
			pagingHTML.append("<a href='/VodShopping/main/memberAdmin.do?pg="+(startPage-1)+"'>이전</a>&nbsp;&nbsp;");
		}
		
		for(int i=startPage;i<=endPage;i++){
			if(currentPage==i){
				pagingHTML.append("<b>["+i+"]</b>&nbsp;&nbsp;");
			}else{
				pagingHTML.append("<a href='javascript:memberAdmin(" + i + ")'>["+i+"]</a>&nbsp;&nbsp;");
			}
		}
		
		if(endPage<totalP){
			pagingHTML.append("<a href='/VodShopping/main/memberAdmin.do?pg="+(startPage+pageBlock)+"'>다음</a>");
		}
		
		return pagingHTML.toString();
	}
}

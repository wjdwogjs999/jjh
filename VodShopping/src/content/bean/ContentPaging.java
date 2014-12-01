package content.bean;


public class ContentPaging {
	public String makePagingHTML(int pg, int pageBlock, int pageSize,int totalA, int category_seq){
		StringBuffer pagingHTML = new StringBuffer();	
		int currentPage = pg;
		int totalP=(totalA+pageSize-1)/pageSize;
		int startPage=((int)((currentPage-1)/pageBlock))*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		if(endPage>totalP){
			endPage=totalP;
		}
		if(startPage>pageBlock){
			pagingHTML.append("<a href='/VodShopping/content/contentList.do?pg="+(startPage-1)+"&category_seq="+category_seq+"'>이전</a>&nbsp;&nbsp;");
		}
		for(int i=startPage;i<=endPage;i++){
			if(currentPage==i){
				pagingHTML.append("<b>["+i+"]</b>&nbsp;&nbsp;");
			}else{
				pagingHTML.append("<a href='javascript:contentList(" + i + ","+category_seq+")'>["+i+"]</a>&nbsp;&nbsp;");
			}
		}
		if(endPage<totalP){
			pagingHTML.append("<a href='/VodShopping/content/contentList.do?pg="+(startPage+pageBlock)+"&category_seq="+category_seq+"'>다음</a>");
		}
		
		return pagingHTML.toString();
	}
	
	public String makePagingHTML(int pg, int pageBlock, int pageSize,int totalA, int category_seq,int subCategory_seq){
		StringBuffer pagingHTML = new StringBuffer();
		
		int currentPage = pg;
				
		int totalP=(totalA+pageSize-1)/pageSize;
		
		int startPage=((int)((currentPage-1)/pageBlock))*pageBlock+1;
		
		int endPage=startPage+pageBlock-1;
		
		if(endPage>totalP){
			endPage=totalP;
		}
		
		if(startPage>pageBlock){
			pagingHTML.append("<a href='/VodShopping/content/subContentList.do?pg="+(startPage-1)+"&category_seq="+category_seq+"&subCategory_seq="+subCategory_seq+"'>이전</a>&nbsp;&nbsp;");
		}
		
		for(int i=startPage;i<=endPage;i++){
			if(currentPage==i){
				pagingHTML.append("<b>["+i+"]</b>&nbsp;&nbsp;");
			}else{
				pagingHTML.append("<a href='javascript:subContentList(" + i + ","+category_seq+","+subCategory_seq+")'>["+i+"]</a>&nbsp;&nbsp;");
			}
		}
		
		if(endPage<totalP){
			pagingHTML.append("<a href='/VodShopping/content/subContentList.do?pg="+(startPage+pageBlock)+"&category_seq="+category_seq+"&subCategory_seq="+subCategory_seq+"'>다음</a>");
		}
		
		return pagingHTML.toString();
	}
}

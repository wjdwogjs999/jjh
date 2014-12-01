package info.bean;

import info.dao.infoDAO;

import org.springframework.beans.factory.annotation.Autowired;


public class InfoPaging {
	@Autowired
	private infoDAO infoDao;
	
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
			pagingHTML.append("<a href='#' onclick='javascript:paging("+(startPage-1)+")'>이전</a>&nbsp;&nbsp;");
		}
		for(int i=startPage;i<=endPage;i++){
			if(currentPage==i){
				pagingHTML.append("<b>["+i+"]</b>&nbsp;&nbsp;");
			}else{
				pagingHTML.append("<a href='#' onclick='javascript:paging("+i+")'>["+i+"]</a>&nbsp;&nbsp;");
			}
		}
		if(endPage<totalP){
			pagingHTML.append("<a href='#' onclick='javascript:paging("+(startPage+pageBlock)+")'>다음</a>");
		}
		return pagingHTML.toString();
	}
}


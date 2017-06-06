package com.cd.clothes.util;

import java.util.List;

public class Page {
	@SuppressWarnings("rawtypes")
	private List list;
	private int pagesize = 1;
	private int totalrecord;
	private int totalpage;
	private int pagenum;
	private int startindex;//
	private int startpage;
	private int endpage;
	private String url;
	
	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public Page(int totalrecord,int pagenum){
		this.totalrecord = totalrecord;
		if(this.totalrecord%this.pagesize==0){
			this.totalpage = this.totalrecord/this.pagesize;
		}else{
			this.totalpage = this.totalrecord/this.pagesize+1;
		}
		this.pagenum = pagenum;
		this.startindex = (this.pagenum-1) * this.pagesize;
		
		if(this.totalpage<=6){
			this.startpage = 1;
			this.endpage = this.totalpage;
		}else{
			this.startpage = this.pagenum - 3;
			this.endpage = this.pagenum+2;
			if(this.startpage<1){
				this.startpage = 1;
				this.endpage =6;
			}
			if(this.endpage>this.totalpage)
			{
				this.startpage = this.totalpage-5;
				this.endpage =this.totalpage;
			}
			
		}
		
		
	}
	
	
	public int getStartpage() {
		return startpage;
	}

	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}

	public int getEndpage() {
		return endpage;
	}

	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	
	public int getPagenum() {
		return pagenum;
	}

	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}

	public int getStartindex() {
		return startindex;
	}

	public void setStartindex(int startindex) {
		this.startindex = startindex;
	}

	@SuppressWarnings("rawtypes")
	public List getList() {
		return list;
	}
	@SuppressWarnings("rawtypes")
	public void setList(List list) {
		this.list = list;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getTotalrecord() {
		return totalrecord;
	}
	public void setTotalrecord(int totalrecord) {
		this.totalrecord = totalrecord;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	
}


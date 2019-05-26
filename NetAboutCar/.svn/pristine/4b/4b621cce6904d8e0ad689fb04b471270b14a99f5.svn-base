package com.nasoft.aboutcar.runtime.mybatis;


public class Pageable {
	private static final long serialVersionUID = 7280485938848398236L;

	private int page;
	private int size;
	private int limit;
	private int offset;
	private String orderBy;

	public Pageable() {
		
	}
	
	public Pageable(int page, int size) {
		this(page, size, null);
	}

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	
	public Pageable(int page, int size, String orderBy) {

		if (page < 0) {
			throw new IllegalArgumentException("Page index must not be less than zero!");
		}

		if (size < 0) {
			throw new IllegalArgumentException("Page size must not be less than zero!");
		}

		this.page = page;
		this.size = size;
		this.orderBy = orderBy;
	}

	public int getPageSize() {

		return size;
	}

	public int getPageNumber() {
		return page;
	}

	public int getOffset() {
		return offset;
	}

	public boolean hasPrevious() {
		return page > 0;
	}

	public Pageable next() {
		return new Pageable(page + 1, size);
	}

	public Pageable previousOrFirst() {
		return hasPrevious() ? new Pageable(page - 1, size) : this;
	}

	public Pageable first() {
		return new Pageable(0, size);
	}

	/* 
	 * (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return String.format("Page request [number: %d, size %d, sort: %s]", page, size);
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}
	
	
}

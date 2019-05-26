package com.nasoft.aboutcar.runtime.mybatis;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;



public class Page<T> {
	private static final long serialVersionUID = 867755909294344406L;

	private final List<T> rows = new ArrayList<T>();
	private final Pageable pageable;
	private final long total;

	public Page(List<T> rows, Pageable pageable, long total) {

		if (null == rows) {
			throw new IllegalArgumentException("Content must not be null!");
		}

		this.rows.addAll(rows);
		this.total = total;
		this.pageable = pageable;
	}

	public Page(List<T> rows) {
		this(rows, null, null == rows ? 0 : rows.size());
	}

	public int getNumber() {
		return pageable == null ? 0 : pageable.getPageNumber();
	}

	public int getSize() {
		return pageable == null ? 0 : pageable.getPageSize();
	}

	public int getTotalPages() {
		return getSize() == 0 ? 1 : (int) Math.ceil((double) total / (double) getSize());
	}

	public int getNumberOfElements() {
		return rows.size();
	}

	public long getTotalElements() {
		return total;
	}

	public long getTotal() {
		return total;
	}
	
	public boolean hasPreviousPage() {
		return getNumber() > 0;
	}

	public boolean isFirstPage() {
		return !hasPreviousPage();
	}

	public boolean hasNextPage() {
		return getNumber() + 1 < getTotalPages();
	}

	public boolean isLastPage() {
		return !hasNextPage();
	}

	public Pageable nextPageable() {
		return hasNextPage() ? pageable.next() : null;
	}

	public Pageable previousPageable() {

		if (hasPreviousPage()) {
			return pageable.previousOrFirst();
		}

		return null;
	}

	public Iterator<T> iterator() {
		return rows.iterator();
	}

	public List<T> getRows() {
		return Collections.unmodifiableList(rows);
	}

	public boolean hasRows() {
		return !rows.isEmpty();
	}


	/*
	 * (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {

		String contentType = "UNKNOWN";

		if (rows.size() > 0) {
			contentType = rows.get(0).getClass().getName();
		}

		return String.format("Page %s of %d containing %s instances", getNumber(), getTotalPages(), contentType);
	}

}

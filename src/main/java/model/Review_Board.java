package model;

import java.sql.Date;

public class Review_Board {
	private int review_num;
	private String review_title;
	private Date review_reg_date;
	private String review_content;
	private int review_read_cnt;
	private int review_likes;
	private int ref_number;
	private int ref_step;
	private int ref_level;
	private String review_hb_tag;
	private String thumbnail;
	private String id;

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public Date getReview_reg_date() {
		return review_reg_date;
	}

	public void setReview_reg_date(Date review_reg_date) {
		this.review_reg_date = review_reg_date;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getReview_read_cnt() {
		return review_read_cnt;
	}

	public void setReview_read_cnt(int review_read_cnt) {
		this.review_read_cnt = review_read_cnt;
	}

	public int getReview_likes() {
		return review_likes;
	}

	public void setReview_likes(int review_likes) {
		this.review_likes = review_likes;
	}

	public int getRef_number() {
		return ref_number;
	}

	public void setRef_number(int ref_number) {
		this.ref_number = ref_number;
	}

	public int getRef_step() {
		return ref_step;
	}

	public void setRef_step(int ref_step) {
		this.ref_step = ref_step;
	}

	public int getRef_level() {
		return ref_level;
	}

	public void setRef_level(int ref_level) {
		this.ref_level = ref_level;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReview_hb_tag() {
		return review_hb_tag;
	}

	public void setReview_hb_tag(String review_hb_tag) {
		this.review_hb_tag = review_hb_tag;
	}

}

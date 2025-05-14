package pojos;

import java.io.Serializable;

public class UpdateBlogPojo implements Serializable {
	private String title;
	private String summary;
	private String content;

	public void setTitle(String title){
		this.title = title;
	}

	public String getTitle(){
		return title;
	}

	public void setSummary(String summary){
		this.summary = summary;
	}

	public String getSummary(){
		return summary;
	}

	public void setContent(String content){
		this.content = content;
	}

	public String getContent(){
		return content;
	}

	@Override
 	public String toString(){
		return 
			"UpdateBlogPojo{" + 
			"title = '" + title + '\'' + 
			",summary = '" + summary + '\'' + 
			",content = '" + content + '\'' + 
			"}";
		}

	public UpdateBlogPojo() {
	}

	public UpdateBlogPojo(String title, String summary, String content) {
		this.title = title;
		this.summary = summary;
		this.content = content;
	}
}
package pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AddBlogPojo {

    /*
    {
       "title" : "New Blog",
       "category_id" :1,
       "summary":"Blog Summary.",
       "content":"Blog Content"
    }
     */

    private String title;
    private int category_id;
    private String summary;
    private String content;

}

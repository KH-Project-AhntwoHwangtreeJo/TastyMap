package com.kh.tastyMap.post.model.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Picture implements Serializable{

   private static final long serialVersionUID = 8118L;
   
   private int picture_No;
   private int pNo;
   private String poriginname;
   private String prenamedname;
    private String plevel;
   private String uploaddate;
   private String picture_status;
   
	private List<Picture> sajin = new ArrayList<Picture>();
   
}

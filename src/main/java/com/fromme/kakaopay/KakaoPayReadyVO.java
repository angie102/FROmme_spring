package com.fromme.kakaopay;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayReadyVO {
	    //response
	    public String tid;
	    public String next_redirect_pc_url;
	    public String next_redirect_mobile_url;
	    public Date created_at;
	    
}

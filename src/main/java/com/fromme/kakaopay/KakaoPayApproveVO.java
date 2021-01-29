package com.fromme.kakaopay;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayApproveVO {
    //response
    private String aid;
    private String tid; 
    private String cid;
    private String sid;
    private String partner_order_id, partner_user_id, payment_method_type;
    private AmountVO amount;
    private CardVO card_info;
    private String item_name, item_code, payload;
    private Integer quantity, tax_free_amount, vat_amount;
    private Date created_at, approved_at;
    
}

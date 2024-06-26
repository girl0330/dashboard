package com.job.dashboard.domain.dto;

import lombok.Data;
import org.springframework.web.util.UriComponentsBuilder;

    @Data
    public class Criteria {
        private int pageNum;    // 페이지 번호
        private int amount;    // 한번에 보여줄 게시물 수
        private String type;    // 검색 종류
        private String keyword; // 검색어

        // 기본 생성자
        public Criteria() {
            this(1, 10);
        }

        // 페이지 번호와 한 번에 보여줄 게시물 수를 받는 생성자
        public Criteria(int pageNum, int amount) {
            // 검색 종류와 검색어는 null로 초기화
            this(pageNum, amount, null, null);
        }

        // 페이지 번호, 한 번에 보여줄 게시물 수, 검색 종류, 검색어를 받는 생성자
        public Criteria(int pageNum, int amount, String type, String keyword) {
            this.pageNum = pageNum;
            this.amount = amount;
            this.type = type;
            this.keyword = keyword;
        }

        // 페이징에 필요한 OFFSET을 계산하는 메서드
        public int getOffset() {
            return (pageNum - 1) * amount;
        }
    }

    // URI 생성 메서드 (기본 경로를 매개변수로 받음)
//    public String createUriWithParams(String basePath) {
//        UriComponentsBuilder builder = UriComponentsBuilder.fromPath(basePath)
//                .queryParam("pageNum", this.pageNum)
//                .queryParam("amount", this.amount)
//                .queryParam("type", this.type)
//                .queryParam("keyword", this.keyword);
//
//        return builder.toUriString();
//    }

    // 여러 경로에 대해 URI 생성 메서드 호출
    //        String postUri = searchCriteria.createUriWithParams("/posts");
    //        String userUri = searchCriteria.createUriWithParams("/users");
    //        String productUri = searchCriteria.createUriWithParams("/products");
//}

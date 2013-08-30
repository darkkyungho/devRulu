# DevRulu (데브룰루) 프로젝트 Repo

## Change log

### 2013.08.30 이준헌
* bower package mangager 설정 추가
  * vendor/assets/bower_components 커스텀 폴더 추가
  * config/environment.rb 에 asset_path 추가
* nprogress 와 turbolink 연결 (페이지 전환시 상단에 로딩 인디케이터 효과)

### 2013.08.30 이준헌
* footer에 github 버튼 추가

### 2013.08.30 이준헌
* Post 모델에 comments 에 대한 counter_cache field 추가
  * polymorphic association의 경우 counter_cache field에 대해 해달 모델에서 readonly로 설정을 해줘야함
    * 일반적인 경우 자동으로 readonly
  * counter_cache 설정법
    * Post 에 comments_count를 integer, default: 0로 추가 및 기존 레코드 업데이트 로직
      * migration 파일을 참고바람
    * comments의 belongs_to :commentable에 counter_cache: true를 추가
  * 실제 사용시 @post.comments.count 대신 @post.comment.size 를 사용
    * count 메소드는 실제 count query가 발생
    * size의 경우 counter_cache가 있을 시 counter_cache를 사용, 없을시 count query
    
* counter_cache의 migration의 경우 기존 필드 업데이트에 주의해야함
  * 반드시 migration 코드를 참고해주세요.

### 2013.08.29 윤연식
* following 기능 추가
  * 사용자 프로필 이미지 안나오는 버그 수정
  * 이미지 크기별 옵션 추가(thumb, small, normal, large) 및 적용
  * 사용자 화면에서 follow, following count 보기
  * follow, unfollow기능추가
  * follow list, following list보기 기능 추가

### 2013.08.29 이준헌
* 태그 자동완성 기능 추가
  * vendor/asssets/stylesheets 밑에 jquery.tokeninput theme 추가
    * app/assets/stylesheets/application.css 에 css 추가
    * app/assets/stylesheets/posts.css.scss 에 token input 관련 css override
  * vendor/assets/javascripts 밑에 jquery.tokeninput 추가
    * app/assets/javascripts/application.js 에 jquery tokeninput js 추가
    * app/assets/javascripts/posts.js.coffee 에 token input 관련 코드 추가
  * controller에 tags action 추가
  * routes에 tags를 posts의 collection으로 추가 (posts/tags)
  * posts/_form.html.erb 에 html data attributes에 현재 글의 tag 추가 (글 에디트용)
  * posts 의 index action 에 tag param 이 있을경우 tag로 filtering하는 기능 추가

### 2013.08.29 이의범
* 댓글 추가
 * polymorphic association을 사용
 * 여러 포스트에 대한 댓글이므로 commentable 로 정의? 

### 2013.08.29 이준헌
* post <-> user 간 관계에 User 모델에 counter_cache 추가
* post에 Tag 달기 추가
  * Gem : acts-as-taggable-on
  * ApplicationHelper 에 tag_list 렌더링 헬퍼 추가 (app/helper/application_helper.rb)
    * Helper는 controller 별로 로드됨. Application controller 는 최상위 base 이기 때문에 마찬가지로 application helper도 모든 뷰에서 사용 가능
  * controller에 tag_list strong_param permit
* initializer에 bootstrap style로 file input을 렌더링 할 수 있도록 config/initializer/simple_form_bootstrap_file_input.rb를 추가

향후 javascript로 tag를 입력하고 autocomplete을 사용하여 tag를 입력하도록 할 예정

### 2013.08.28 이범재
* Post에 이미지업로드 기능 추가
  * Gem : CarrierWave , RMagick
  * Image Uploader 생성 : Rails generate Uploader Image
  * Post 모델에 Image 컬럼 추가 : Rails generate migration add_image_to_posts image:string
  * Post 모델에 ImageUploader Mount
  * Post Controller의 post_params Permit에 :image 추가
  * Post View _form에 image필드 추가
  * Post View index, show, _post 에 image 태그 추가 

  이후 Imageupload에 small, medium, large 사이즈 버전을 추가할 예정

### 2013.08.28 윤연식
* 유저정보 뷰 기능 추가
  * 왼쪽 사이드 메뉴에 Post List, User List 링크 추가
  * 가입한 유저들 목록 보여주는 화면 추가
  * 유저들의 개인별 프로필화면 추가
  * Post List, User List에 페이징 기능 추가
    (Gem : will_paginate, bootstrap-will_paginate)

## 프로젝트 멤버
* 임경호 (팀장)
* 이의범
* 이준헌
* 이범재
* 방정현
* 박창진
* 윤연식

## 페이스북 그룹
[devRulu](https://www.facebook.com/groups/289315441209766/)

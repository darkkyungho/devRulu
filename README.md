# DevRulu (데브룰루) 프로젝트 Repo

## Change log

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
연식님이 기능 추가한듯.. 간략 설명 달아주세요.

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

# DevRulu (데브룰루) 프로젝트 Repo

## Change log
### 2013.08.29 이준헌
* post <-> user 간 관계에 User 모델에 counter_cache 추가
* post에 댓글 달기 추가
  * Gem : acts-as-taggable-on
  * ApplicationHelper 에 tag_list 렌더링 헬퍼 추가 (app/helper/application_helper.rb)
    * Helper는 controller 별로 로드됨. Application controller 는 최상위 base 이기 때문에 마찬가지로 application helper도 모든 뷰에서 사용 가능
  * controller에 tag_list strong_param permit
* initializer에 bootstrap style로 file input을 렌더링 할 수 있도록 config/initializer/simple_form_bootstrap_file_input.rb를 추가

향후 javascript로 tag를 입력하고 autocomplete을 사용하여 tag를 입력하도록 할 예정

### 2013.08.28
범재님, 연식님이 기능 추가한듯.. 간략 설명 달아주세요.

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

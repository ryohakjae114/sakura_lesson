# README

railsアプリの共通化できるファイルとフォルダの一覧になります。

* バージョン
  * ruby 3.3.5
  * rails 7.2.1
  
* 使い方
  ```
  ghq get git@github.com:ryohakjae114/template_rails.git
  ```
  * ディレクトリ名をアプリ名に変更
  * プロジェクト内の`template_rails`をアプリ名のスネークケースに一括置換
  * プロジェクト内の`TemplateRails`をアプリ名のキャメルケース(1文字目も大文字)に一括置換
  * database.yml.sampleからdatabase.ymlを複製
  ```
  bundle install
  ```
  ```
  yarn install
  ```
  * リモートリポジトリを作成
  ```
  git remote set-url origin {new url}
  ```

require 'rails_helper'
RSpec.describe 'ラベル管理機能', type: :system do

    before do
      FactoryBot.create(:user)
      FactoryBot.create(:user2)
    end

  describe 'ラベル登録機能' do
    context 'タスクを新規作成時、ラベルを選択した場合' do
      it 'ラベルが登録される・ラベルが表示される' do
        FactoryBot.create(:label)
        FactoryBot.create(:label2)
        FactoryBot.create(:label3)

        visit new_session_path
        fill_in 'session[email]', with: 'testuser01@docomo.ne.jp'
        fill_in 'session[password]', with: 'password'
        click_on 'log_in'
        visit tasks_path
        visit new_task_path
        fill_in "task_title", with: 'title'
        fill_in "task_content", with: 'content'
        select '高', from: 'task[priority]'
        fill_in 'deadline', with: '2021/07/15'
        select '未着手', from: 'task_status'
        check 'task_label_ids_1'
        click_on '登録する'
        visit tasks_path
        expect(page).to have_content 'ルビー'
      end

    end

    context 'ラベルを複数登録した場合' do

      it '複数のラベルが登録される' do
        FactoryBot.create(:label)
        FactoryBot.create(:label2)
        FactoryBot.create(:label3)

        visit new_session_path
        fill_in 'session[email]', with: 'testuser01@docomo.ne.jp'
        fill_in 'session[password]', with: 'password'
        click_on 'log_in'
        visit tasks_path
        visit new_task_path
        fill_in "task_title", with: 'title2'
        fill_in "task_content", with: 'content2'
        select '中', from: 'task[priority]'
        fill_in 'deadline', with: '2021/07/25'
        select '着手中', from: 'task_status'
        check 'task_label_ids_4'
        check 'task_label_ids_5'
        click_on '登録する'
        visit tasks_path
        expect(page).to have_content 'ルビー'
        expect(page).to have_content 'サファイア'
      end

    end

    context 'タスク編集時にラベルの選択を変更した場合' do
      it '変更したラベルに変わる' do
        FactoryBot.create(:label)
        FactoryBot.create(:label2)
        FactoryBot.create(:label3)

        visit new_session_path
        fill_in 'session[email]', with: 'testuser01@docomo.ne.jp'
        fill_in 'session[password]', with: 'password'
        click_on 'log_in'
        visit tasks_path
        visit new_task_path
        fill_in "task_title", with: 'title4'
        fill_in "task_content", with: 'content4'
        select '中', from: 'task[priority]'
        fill_in 'deadline', with: '2021/07/25'
        select '着手中', from: 'task_status'
        check 'task_label_ids_7'
        
        click_on '登録する'
        visit tasks_path
        all('tr td')[8].click_link # 特定のUserの編集画面に移動する        click_on '編集'
        check 'task_label_ids_9'
        click_on '更新する'
        expect(page).to have_content 'パール'
      end
    end
  end

  describe 'ラベル検索機能' do
    context '一覧画面でラベルを検索した場合' do
      it '検索に引っかかるタスクが表示される' do
        FactoryBot.create(:label)
        FactoryBot.create(:label2)
        FactoryBot.create(:label3)

        visit new_session_path
        fill_in 'session[email]', with: 'testuser01@docomo.ne.jp'
        fill_in 'session[password]', with: 'password'
        click_on 'log_in'
        visit tasks_path
        visit new_task_path
        fill_in "task_title", with: 'title4'
        fill_in "task_content", with: 'content4'
        select '高', from: 'task[priority]'
        fill_in 'deadline', with: '2021/07/25'
        select '未着手', from: 'task_status'
        check 'task_label_ids_10'
        click_button '登録する'
        visit tasks_path
        select 'ルビー', from: 'search[label_id]'
        click_on 'ラベル検索'
        expect(page).to have_content 'ルビー'
      end
    end
  end

end

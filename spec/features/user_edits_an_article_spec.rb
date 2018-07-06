require 'rails_helper'

describe 'user edits an article' do
  describe 'they link from a show page' do
    describe 'they fill in an edit field' do
      it 'and submit displays the updated information on a show page' do
        article = Article.create!(title: 'Title', body: 'Body')

        visit article_path(article)
        click_on 'Edit'

        expect(current_path).to eq(edit_article_path(article))

        fill_in('article[title]', with: "New Title")
        fill_in('article[body]', with: "New Body")
        click_on "Update"

        expect(page).to have_content("New Title")
        expect(page).to have_content("New Body")
        expect(page).to have_content("Article 'New Title' Updated!")
      end
    end
  end
end

class CustomFieldsDataset < Dataset::Base

  uses :pages
  def load
    create_record :custom_fields, :first_st, {:name => 'stereotype', :value => 'post', :page_id => pages(:first).id}
    create_record :custom_fields, :parent_st, {:name => 'stereotype', :value => 'article', :page_id => pages(:parent).id}
  end
end
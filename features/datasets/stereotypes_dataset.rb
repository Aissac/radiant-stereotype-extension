class Stereotypes < Dataset::Base
  
  def load
    Radiant::Config['stereotype.post.parts'] = "body:markdown,sidebar:textile"
    Radiant::Config['stereotype.post.layout'] = 'Main'
    Radiant::Config['stereotype.post.status'] = 'published'
    Radiant::Config['stereotype.post.page_type'] = 'ArchivePage'
  end
end
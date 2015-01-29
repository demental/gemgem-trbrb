class Thing::Cell < Cell::Concept

  include ActionView::Helpers::DateHelper
  include Rails::Timeago::Helper

  property :created_at
  property :name

  def show
    render
  end

private

  def created_at
    timeago_tag(super, nojs: true)
  end

  def name_link
    link_to name, thing_path(model)
  end

  def classes
    classes = ["large-3","columns"]
    classes << "end" if options[:last] == model
    classes
  end
end

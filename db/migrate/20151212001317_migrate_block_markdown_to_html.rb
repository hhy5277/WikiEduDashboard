class MigrateBlockMarkdownToHtml < ActiveRecord::Migration
  def change
    Block.all.each do |block|
      p "migrating block #{block.id}"
      markdown = markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      block.update_attribute(:content, markdown.render(block.content))
    end
  end
end

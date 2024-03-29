# rubocop:disable Layout/HeredocIndentation
# Markdown depends on this indentation, rubocop wants to enforce
# two leading space.  Rubocop can get lost

markdown_for_top_page = <<-MARKDOWN_FOR_TOP_PAGE


## Resources for members

### Understanding the world resources

[Personal experiences]()

[Diverse world]()

[Widening vocabulary]()

### What the early years foundation stage (EYFS) framework says about understanding the world
Understanding the world involves guiding children to make sense of their physical world and their community.

### Read more
The frequency and range of children’s personal experiences increases their knowledge and sense of the world around them – from visiting parks, libraries and museums to meeting important members of society such as police officers, nurses and firefighters.

In addition, listening to a broad selection of stories, non-fiction, rhymes and poems will foster their understanding of our culturally, socially, technologically and ecologically diverse world.

As well as building important knowledge, this extends their familiarity with words that support understanding across domains.

Enriching and widening children’s vocabulary will support later reading comprehension.

[![Early Years Foundation Stage: Children build a number line](http://img.youtube.com/vi/SYhhCcokBF8/0.jpg)](http://www.youtube.com/watch?v=SYhhCcokBF8)

MARKDOWN_FOR_TOP_PAGE

understanding_the_world = {
  title: "Resources for members",
  markdown: markdown_for_top_page,
  position: 6,
}
understanding_the_world_page = ContentPage.new understanding_the_world
understanding_the_world_page.save!

#
markdown_for_personal_experiences = <<-MARKDOWN_FOR_PERSONAL_EXPERIENCES

This page is still being written.

MARKDOWN_FOR_PERSONAL_EXPERIENCES
personal_experiences = {
  title: "Personal experiences",
  markdown: markdown_for_personal_experiences,
  position: 1,
  parent_id: understanding_the_world_page.id,
}
personal_experiences_page = ContentPage.new personal_experiences
personal_experiences_page.save!

#####################################################################################
#
#
markdown_for_diverse_world = <<-MARKDOWN_FOR_DIVERSE_WORLD

This page is still being written.

MARKDOWN_FOR_DIVERSE_WORLD
diverse_world = {
  title: "Diverse world",
  markdown: markdown_for_diverse_world,
  position: 2,
  parent_id: understanding_the_world_page.id,
}
diverse_world_page = ContentPage.new diverse_world
diverse_world_page.save!

#####################################################################################
#
#
markdown_for_widening_vocabulary = <<-MARKDOWN_FOR_WIDENING_VOCABULARY

This page is still being written.

MARKDOWN_FOR_WIDENING_VOCABULARY
widening_vocabulary = {
  title: "Widening vocabulary",
  markdown: markdown_for_widening_vocabulary,
  position: 3,
  parent_id: understanding_the_world_page.id,
}
widening_vocabulary_page = ContentPage.new widening_vocabulary
widening_vocabulary_page.save!
# rubocop:enable Layout/HeredocIndentation

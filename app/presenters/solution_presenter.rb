class SolutionPresenter < BasePresenter
  presents :solution
          
  def up_vote_arrow
    link_to('', challenge_solution_up_vote_path(solution.challenge, solution), id: "up_vote_#{solution.id}", class: "up icon-arrow-up vote-arrow #{up_arrow_class}")
  end

  def down_vote_arrow
    link_to('', challenge_solution_down_vote_path(solution.challenge, solution), id: "down_vote_#{solution.id}", class: "down icon-arrow-down vote-arrow #{down_arrow_class}")
  end

  def vote_cell
    content_tag(:div, class: 'vote-cell cell', rel: solution.id) do
      content_tag(:div, class: 'arrows') do
        if user_signed_in?
          up_vote_arrow +
          tag('br') +
          down_vote_arrow
        end
      end +
      content_tag(:div, class: 'vote-count') do
        content_tag(:div, class: 'label') { 'votes' } +
        content_tag(:div, class: 'count') { solution.positives.size }
      end
    end
  end

private

  def down_arrow_class
    current_user.voted_down_on?(solution) ? 'icon-circle-arrow-down' : nil
  end

  def up_arrow_class
    current_user.voted_up_on?(solution) ? 'icon-circle-arrow-up' : nil
  end
end
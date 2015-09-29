class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: review.dinosaur.user.email,
      subject: "New Review for #{review.dinosaur.name}"
    )
  end
end

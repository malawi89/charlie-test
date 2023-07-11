class CharlieMenu < Service
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def call
    {
      "menu": [
      {
      "title": "Chat",
      "url": "#chat"
      },
      {
      "title": "Help",
      "url": "/help"
      },
      {
      "title": "Product Roadmap",
      "url": "https://roadmap.charliehr.com"
      },
      {
      "title": "What's New",
      "url": "/whats_new"
      }
      ]
    }.merge(hat)
  end

  private

  def hat
    if birthday
      {hat: {"image": "party", "message": "Happy birthday!"}}
    elsif anniversary
      {hat: {"image": "party", "message": "Happy work anniversary!"}}
    elsif halloween
      {hat: {"image": "witch", "message": "Boo!"}}
    elsif christmas
      {hat: {"image": "santa", "message": "Merry Christmas!"}}
    else
      {hat: {"image": "none", "message": "none"}}
    end
  end

  def birthday
    Date.today.month == user.dob.month && Date.today.day == user.dob.day
  end

  def anniversary
    Date.today.month == user.employment_started_at.month && Date.today.day == user.employment_started_at.day
  end

  def halloween
    Date.today.month == 10 && Date.today.day == 31
  end

  def christmas
    Date.today.month == 12 && Date.today.day == 25
  end
end
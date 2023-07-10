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
    (Date.today - user.dob) / 365 == 0
  end

  def anniversary
    (Date.today - user.employment_started_at) / 365 == 0
  end

  def halloween
    Date.today.month == 10 && Date.today.day == 31
  end

  def christmas
    Date.today.month == 12 && Date.today.day == 25
  end
end
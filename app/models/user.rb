# user model makes a new user. It takes an email and makes it all lower case,
# then checks for a non-nil value for name under 50 chars.
# VALID_EMAIL_REGEX is a constant that does a lot of magic things. It basically checks
# so see if the email is (mostly) legitamate based on a standard list of things to check against.
# It gets passed to the next line that checks if there is an email, if it is standard-ish, if
# it is uniquee to the database, and doublechecks the case sensetivity since we store emails as lowercase.
# Finally we check if password is secure. the 'has_secure_password' is a bit mroe magic. Built in method?
# We then run through the same motions as with email to make sure we hve a good pw.
# see railstutorial.org Chapter 6.2 - 6.3

class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: {case_sensitive: false }
  has_secure_password
  # sets password requirements. Might have additional requiremetns in the future. (8 characters, letters, numbers.)
  validates :password, presence: true, length: { minimum: 6 }
end


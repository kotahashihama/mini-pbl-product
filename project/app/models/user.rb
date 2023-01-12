class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A([\w+-]+.?[\w+-]+)+@([\w-]+.?[\w-]+)+.[\w-]+\z/i
    validates :name, presence: { message: "名前を入力してください" }, \
                     uniqueness: { message: "名前が既に使われています" }, \
                     length: { maximum: 20, message: "名前の長さは20文字以内です" }
    validates :email, presence: { message: "メールアドレスを入力してください" }, \
                      uniqueness: { message: "メールアドレスが登録済みです" }, \
                      format: { with: VALID_EMAIL_REGEX, message: "メールアドレスが適切ではありません" }
    validates :password, presence: { message: "パスワードを入力してください" }, \
                         uniqueness: { message: "パスワードが使われています" }, \
                         length: { minimum: 6, message: "パスワードを6文字以上にしてください" }

    def generate_digest
        user.password_digest = BCrypt::Password.create(contract.password)
    end
end

FROM ruby:3.2.8

# 必要パッケージのインストール
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libsqlite3-dev \
  nodejs \
  curl \
  vim

# 作業ディレクトリ作成
WORKDIR /app

# Gemfile 関連をコピーして bundle install
COPY Gemfile Gemfile.lock ./
RUN bundle install


# 残りのファイルをコピー
COPY . .

# 起動前スクリプトのコピー
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Puma を起動
CMD ["rails", "server", "-b", "0.0.0.0"]

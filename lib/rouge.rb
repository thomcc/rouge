# stdlib
require 'pathname'

module Rouge
  class << self
    def highlight(text, lexer, formatter)
      lexer = Lexer.find(lexer) unless lexer.respond_to? :lex
      raise "unknown lexer #{lexer}" unless lexer

      formatter.render(lexer.lex(text))
    end
  end
end

load_dir = Pathname.new(__FILE__).dirname
load load_dir.join('rouge/token.rb')
load load_dir.join('rouge/lexer.rb')
load load_dir.join('rouge/lexers/text.rb')
load load_dir.join('rouge/lexers/diff.rb')

load load_dir.join('rouge/lexers/shell.rb')

load load_dir.join('rouge/lexers/javascript.rb')
load load_dir.join('rouge/lexers/css.rb')
load load_dir.join('rouge/lexers/html.rb')

load load_dir.join('rouge/lexers/tcl.rb')

load load_dir.join('rouge/formatter.rb')
load load_dir.join('rouge/formatters/html.rb')

load load_dir.join('rouge/theme.rb')
load load_dir.join('rouge/themes/thankful_eyes.rb')
load load_dir.join('rouge/themes/colorful.rb')
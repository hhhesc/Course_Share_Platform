module ApplicationHelper
    # for markdown
    class HtmlWithCoderay < Redcarpet::Render::HTML
        def block_code(code, language)
            CodeRay.scan(code, language).div()
        end
    end

    def markdown(text)
        render_options = {
            filter_html: true,
            hard_wrap: true,
            with_toc_data: true,
            link_attributes: { rel: 'nofollow', target: '_blank' }
        }
        html_with_coderay = HtmlWithCoderay.new(render_options)

        options = {
            :fenced_code_blocks => true,
            :no_intra_emphasis => true,
            :autolink => true,
            :tables => true,
            :strikethrough => true,
            :lax_html_blocks => true,
            :superscript => true
        }
        markdown_to_html = Redcarpet::Markdown.new(html_with_coderay, options)
        markdown_to_html.render(text).html_safe
    end

    # end: markdown

end
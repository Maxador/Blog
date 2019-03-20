import Vapor
import HtmlVaporSupport
import CommonMark

final class PostController: RouteCollection {
    let postService: PostService

    init(postService: PostService) {
        self.postService = postService
    }

    func boot(router: Router) throws {
        let posts = router.grouped("posts")
        posts.get(use: index)
    }

    func index(req: Request) -> Html.Node {
        let posts = self.postService.getPosts()
        return html([
            head(title: "Blog", content: [
                link([
                    type(.text(Text.css, charset: nil)),
                    rel(.stylesheet),
                    href("assets/css/main.css")
                ])
            ]),
            body([
                h1([.text("This is a H1")]),
                .raw(CommonMark.Node(markdown: "## H2 from a Markdown string")!.html),
                p([.text("This is a paragraph")]),
                span([.text("This is a span")]),
                div([postList(posts)])
                  ]),
            ])
    }
}

func postList(_ posts: [Post]) -> Html.Node {
    return ul(posts.map { li([
        b([.raw($0.title)]),
        .raw(": \($0.content)")
        ])
    })
}

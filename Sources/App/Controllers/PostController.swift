import Vapor
import HtmlVaporSupport
import CommonMark

final class PostController: RouteCollection {
    func boot(router: Router) throws {
        let posts = router.grouped("posts")
        posts.get(use: index)
    }

    func index(req: Request) -> Html.Node {
        return html([
            head(title: "Blog"),
            body([
                h1([.text("This is a H1")]),
                .raw(CommonMark.Node(markdown: "## H2 from a Markdown string")!.html),
                p([.text("This is a paragraph")])
                  ])
            ])
    }
}

import { PageLayout, SharedLayout } from "./quartz/cfg"
import * as Component from "./quartz/components"

// components shared across all pages
export const sharedPageComponents: SharedLayout = {
  head: Component.Head(),
  header: [],
  afterBody: [],
  footer: Component.Footer({
    links: {
      GitHub: "https://github.com/jackyzha0/quartz",
      "Discord Community": "https://discord.gg/cRFFHYye7t",
    },
  }),
}

// components for pages that display a single page (e.g. a single note)
export const defaultContentPageLayout: PageLayout = {
  beforeBody: [
    Component.Breadcrumbs(),
    // Component.ArticleTitle(),
    Component.ContentMeta(),
    Component.TagList(),
  ],
  left: [
    Component.PageTitle(),
    Component.MobileOnly(Component.Spacer()),
    Component.Flex({
      components: [
        {
          Component: Component.Search(),
          grow: true,
        },
        { Component: Component.Darkmode() },
      ],
    }),
    Component.Explorer({'title': 'On this site','folderClickBehavior':'link',
      mapFn: (node) => {
      if (node.displayName === "000_processed") {
        node.displayName = "Other"
      }
      if (node.isFolder) {
        node.displayName = "📁 " + node.displayName
      } else {
        node.displayName = "📄 " + node.displayName
      }
    },
    // Sort order: folders first, then files. Sort folders and files alphabetically
    sortFn: (a, b) => {
      if ((!a.isFolder && !b.isFolder) || (a.isFolder && b.isFolder)) {
        return a.displayName.localeCompare(b.displayName, undefined, {
          numeric: true,
          sensitivity: "base",
        })
      }

      if (!a.isFolder && b.isFolder) {
        return 1
      } else {
        return -1
      }
    },

    // Remove files
    filterFn: (node) => {
      // set containing names of everything you want to filter out
      const omit = new Set(["authoring content", "tags", "advanced"])

      // can also use node.slug or by anything on node.data
      // note that node.data is only present for files that exist on disk
      // (e.g. implicit folder nodes that have no associated index.md)
      return (
      (!omit.has(node.displayName.toLowerCase()))
      // && (!node.data.tags?.includes("explorerexclude") == true)
      )
    },
  }),
  ],
  right: [
    Component.DesktopOnly(Component.TableOfContents()),
    Component.Backlinks(),
    Component.RecentNotes({"title": "Recent", limit: 5,showTags: false,}),
  ],
  afterBody: [
    Component.Graph({localGraph: {linkDistance: 120, fontSize: 0.8,repelForce: 0.5,centerForce: 0.3,opacityScale: 2,enableRadial: true,focusOnHover: true}, globalGraph: {linkDistance: 200, fontSize: 0.8,repelForce: 0.5,centerForce: 0.2,opacityScale: 2,enableRadial: true,focusOnHover: true}}),
    Component.Comments({
      provider: 'giscus',
      options: {
        // from data-repo
        repo: 'fluentnumbers/obsidian-quartz',
        // from data-repo-id
        repoId: 'R_kgDOOjDg7A',
        // from data-category
        category: 'Announcements',
        // from data-category-id
        categoryId: 'DIC_kwDOOjDg7M4Cps1s',
        "data-mapping":"pathname",
        "data-strict":"0",
        "data-reactions-enabled":"1",
        "data-emit-metadata":"0",
        "data-input-position":"top",
        "data-theme":"preferred_color_scheme",
        "data-lang":"en",
        "crossorigin":"anonymous"
      }
    }),
  ],
}

// components for pages that display lists of pages  (e.g. tags or folders)
export const defaultListPageLayout: PageLayout = {
  beforeBody: [Component.Breadcrumbs(), Component.ArticleTitle(), Component.ContentMeta()],
  left: [
    Component.PageTitle(),
    Component.MobileOnly(Component.Spacer()),
    Component.Flex({
      components: [
        {
          Component: Component.Search(),
          grow: true,
        },
        { Component: Component.Darkmode() },
      ],
    }),
    Component.Explorer({'title': 'On this site','folderClickBehavior':'link', mapFn: (node) => {
      if (node.displayName === "000_processed") {
        node.displayName = "Other"
      }
      if (node.isFolder) {
        node.displayName = "📁 " + node.displayName
      } else {
        node.displayName = "📄 " + node.displayName
      }
    },}),
  ],
  right: [],
}

import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

/**
 * Quartz 4.0 Configuration
 *
 * See https://quartz.jzhao.xyz/configuration for more information.
 */
const config: QuartzConfig = {
  configuration: {
    pageTitle: "Fluent Numbers 🌱",
    enableSPA: true,
    enablePopovers: true,
    analytics: {
      provider: 'google', tagId: 'G-58YMG7L17G' ,
    },
    locale: "en-US",
    baseUrl: "fluentnumbers.com",
    ignorePatterns: ["private", "templates", ".obsidian", "drafts","!published**/!(*.md)", "!(*.md)","!icons**/!(*.md)","!icon.png"],
    defaultDateType: "created",
    theme: {
      fontOrigin: "googleFonts",
      cdnCaching: true,
      typography: {
        header: "Poppins",
        body: "Lora",
        code: "Fira Code",
      },
      colors: {
        lightMode: {
          light: "#fbfaf9",
          lightgray: "#edebe8",
          gray: "#a3a3a3",
          darkgray: "#575757",
          dark: "#272727",
          secondary: "#3b82f6",
          tertiary: "#6b7280",
          highlight: "rgba(143, 159, 169, 0.15)",
          textHighlight: "#fff23688",
        },
        darkMode: {
          light: "#1f2937",
          lightgray: "#374151",
          gray: "#9ca3af",
          darkgray: "#d1d5db",
          dark: "#f9fafb",
          secondary: "#60a5fa",
          tertiary: "#9ca3af",
          highlight: "rgba(96, 165, 250, 0.1)",
          textHighlight: "#b3aa0288",

        },
      },
    },
  },
  plugins: {
    transformers: [
      Plugin.FrontMatter(),
      Plugin.CreatedModifiedDate({
        priority: ["frontmatter", "filesystem", "git"],
      }),
      Plugin.SyntaxHighlighting({
        theme: {
          light: "github-light",
          dark: "github-dark",
        },
        keepBackground: false,
      }),
      Plugin.ObsidianFlavoredMarkdown({ enableInHtmlEmbed: false }),
      Plugin.GitHubFlavoredMarkdown(),
      Plugin.HardLineBreaks(),
      Plugin.TableOfContents({maxDepth: 6}),
      Plugin.CrawlLinks({ markdownLinkResolution: "shortest", indexFrontmatterWikilinks:true, prettyLinks:false}),
      Plugin.Description(),
      Plugin.Latex({ renderEngine: "katex" }),
    ],
    filters: [Plugin.RemoveDrafts(),Plugin.ExplicitPublish()],
    emitters: [
      Plugin.AliasRedirects(),
      Plugin.ComponentResources(),
      Plugin.ContentPage(),
      Plugin.FolderPage({
        // sortFn: (f1, f2) => {
        //   const f1Title = f1.frontmatter?.title.toLowerCase() ?? ""
        //   const f2Title = f2.frontmatter?.title.toLowerCase() ?? ""
        //   return f1Title.localeCompare(f2Title)
        // },
      }),
      Plugin.TagPage(),
    // Plugin.CNAME(),
      Plugin.ContentIndex({
        enableSiteMap: true,
        enableRSS: true,

      }),
      Plugin.Assets(),
      Plugin.Static(),
      Plugin.NotFoundPage(),
    ],
  },
}

export default config

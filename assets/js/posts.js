/* =====================================================================
   THE JOURNAL — POST MANIFEST
   To publish a new essay:
     1. Copy post-template.html -> post-your-slug.html, fill it in.
     2. Add ONE entry to the TOP of this array (newest first).
     3. Commit both files. Done — writing.html renders from this list.
   Fields:
     href     post file name
     cat      ai-robotics | semis-infra | thoughts-misc  (must match filter chips)
     catLabel display label for the category
     no       chronological number as a string, next = highest + 1 (never reuse)
     read     e.g. "5 min read"
     title    plain text (typographic quotes ok)
     dek      one-sentence teaser
     img      local path under assets/img/ (download via scripts/download-images.sh)
     imgAlt   painter + painting name
   ===================================================================== */
const POSTS = [
  {
    href: "posts/post-no-deep-learning.html",
    cat: "ai-robotics", catLabel: "AI & Robotics",
    no: "004", read: "5 min read",
    title: "Why we didn\u2019t use deep learning",
    dek: "The best-reviewed tool I ever shipped is, under the hood, almost boring. That was the decision.",
    img: "assets/img/lacemaker.jpg",
    imgAlt: "Johannes Vermeer, The Lacemaker"
  },
  {
    href: "posts/post-ai-tutor.html",
    cat: "ai-robotics", catLabel: "AI & Robotics",
    no: "003", read: "4 min read",
    title: "How I accidentally became an AI tutor",
    dek: "On building one small tool, and the brilliant people it turned out to help.",
    img: "assets/img/astronomer.jpg",
    imgAlt: "Johannes Vermeer, The Astronomer"
  },
  {
    href: "posts/post-zerotoone.html",
    cat: "thoughts-misc", catLabel: "Thoughts & Misc",
    no: "002", read: "5 min read",
    title: "Monopoly isn\u2019t a dirty word",
    dek: "Three ideas from Zero to One — on competition, two kinds of optimists, and why a friend of mine quit a startup.",
    img: "assets/img/wanderer.jpg",
    imgAlt: "Caspar David Friedrich, Wanderer above the Sea of Fog"
  },
  {
    href: "posts/post-buildout.html",
    cat: "semis-infra", catLabel: "Semiconductors & Infra",
    no: "001", read: "6 min read",
    title: "All-you-can-eat compute",
    dek: "Arguments with a chip investor: the monopoly that forgot to charge more, and whose robots get to learn.",
    img: "assets/img/babel.jpg",
    imgAlt: "Pieter Bruegel the Elder, The Tower of Babel"
  }
];

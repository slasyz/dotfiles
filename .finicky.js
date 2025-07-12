export default {
  defaultBrowser: {
    name: "Vivaldi"
  },

  // Use this as workaround: create Automator "application" that runs shell script:
  // IFS=';' read -r profile_dir url <<< "$1" && /Applications/Vivaldi.app/Contents/MacOS/Vivaldi --profile-directory="$profile_dir" "$url"
  handlers: [
    {
      match: [
        "*.incsecurity/*",
        "10.0.29.*",
        "10.0.30.*",
        "portal.couch.ru/*",
        "portal.couch.ru",
      ],
      browser: (url) => ({
        // name: "/Applications/Vivaldi.app",
        // args: ['--profile-directory=Profile 1', url.toString()],
        name: "VivaldiFinicky",
        args: ["Profile 1;"+url.toString()],
      }),
    },
    {
      match: [
        "vas3k.club/*",
      ],
      browser: (url) => ({
        // name: "/Applications/Vivaldi.app",
        // args: ["--profile-directory=Default", url.toString()],
        name: "VivaldiFinicky",
        args: ["Default;" + url.toString()],
      }),
    },
  ],
};

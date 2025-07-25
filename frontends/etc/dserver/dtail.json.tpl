{
  "Client": {
    "TermColorsEnable": true,
    "TermColors": {
      "Remote": {
        "DelimiterAttr": "Dim",
        "DelimiterBg": "Blue",
        "DelimiterFg": "Cyan",
        "RemoteAttr": "Dim",
        "RemoteBg": "Blue",
        "RemoteFg": "White",
        "CountAttr": "Dim",
        "CountBg": "Blue",
        "CountFg": "White",
        "HostnameAttr": "Bold",
        "HostnameBg": "Blue",
        "HostnameFg": "White",
        "IDAttr": "Dim",
        "IDBg": "Blue",
        "IDFg": "White",
        "StatsOkAttr": "None",
        "StatsOkBg": "Green",
        "StatsOkFg": "Black",
        "StatsWarnAttr": "None",
        "StatsWarnBg": "Red",
        "StatsWarnFg": "White",
        "TextAttr": "None",
        "TextBg": "Black",
        "TextFg": "White"
      },
      "Client": {
        "DelimiterAttr": "Dim",
        "DelimiterBg": "Yellow",
        "DelimiterFg": "Black",
        "ClientAttr": "Dim",
        "ClientBg": "Yellow",
        "ClientFg": "Black",
        "HostnameAttr": "Dim",
        "HostnameBg": "Yellow",
        "HostnameFg": "Black",
        "TextAttr": "None",
        "TextBg": "Black",
        "TextFg": "White"
      },
      "Server": {
        "DelimiterAttr": "AttrDim",
        "DelimiterBg": "BgCyan",
        "DelimiterFg": "FgBlack",
        "ServerAttr": "AttrDim",
        "ServerBg": "BgCyan",
        "ServerFg": "FgBlack",
        "HostnameAttr": "AttrBold",
        "HostnameBg": "BgCyan",
        "HostnameFg": "FgBlack",
        "TextAttr": "AttrNone",
        "TextBg": "BgBlack",
        "TextFg": "FgWhite"
      },
      "Common": {
        "SeverityErrorAttr": "AttrBold",
        "SeverityErrorBg": "BgRed",
        "SeverityErrorFg": "FgWhite",
        "SeverityFatalAttr": "AttrBold",
        "SeverityFatalBg": "BgMagenta",
        "SeverityFatalFg": "FgWhite",
        "SeverityWarnAttr": "AttrBold",
        "SeverityWarnBg": "BgBlack",
        "SeverityWarnFg": "FgWhite"
      },
      "MaprTable": {
        "DataAttr": "AttrNone",
        "DataBg": "BgBlue",
        "DataFg": "FgWhite",
        "DelimiterAttr": "AttrDim",
        "DelimiterBg": "BgBlue",
        "DelimiterFg": "FgWhite",
        "HeaderAttr": "AttrBold",
        "HeaderBg": "BgBlue",
        "HeaderFg": "FgWhite",
        "HeaderDelimiterAttr": "AttrDim",
        "HeaderDelimiterBg": "BgBlue",
        "HeaderDelimiterFg": "FgWhite",
        "HeaderSortKeyAttr": "AttrUnderline",
        "HeaderGroupKeyAttr": "AttrReverse",
        "RawQueryAttr": "AttrDim",
        "RawQueryBg": "BgBlack",
        "RawQueryFg": "FgCyan"
      }
    }
  },
  "Server": {
    "SSHBindAddress": "0.0.0.0",
    "HostKeyFile": "cache/ssh_host_key",
    "HostKeyBits": 2048,
    "MapreduceLogFormat": "default",
    "MaxConcurrentCats": 2,
    "MaxConcurrentTails": 50,
    "MaxConnections": 50,
    "MaxLineLength": 1048576,
    "Permissions": {
      "Default": [
        "readfiles:^/.*$"
      ],
      "Users": {
        "paul": [
          "readfiles:^/.*$"
        ],
        "pbuetow": [
          "readfiles:^/.*$"
        ],
        "jamesblake": [
          "readfiles:^/tmp/foo.log$",
          "readfiles:^/.*$",
          "readfiles:!^/tmp/bar.log$"
        ]
      }
    }
  },
  "Common": {
    "LogDir": "/var/log/dserver",
    "Logger": "Fout",
    "LogRotation": "Daily",
    "CacheDir": "cache",
    "SSHPort": 2222,
    "LogLevel": "Info"
  }
}

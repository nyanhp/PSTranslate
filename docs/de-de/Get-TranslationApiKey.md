---
external help file: PSTranslate-help.xml
Module Name: PSTranslate
online version:
schema: 2.0.0
---

# Get-TranslationApiKey

## SYNOPSIS
Gibt den zu verwendenden API-Key aus

## SYNTAX

```
Get-TranslationApiKey [-Provider] <String> [<CommonParameters>]
```

## DESCRIPTION
Gibt den zu verwendenden API-Key aus

## EXAMPLES

### EXAMPLE 1
```
Get-TranslationApiKey -Provider 'Azure'
```

Gibt den zu verwendenden API-Key aus, der zur
Verwendung von Azure genutzt wird

## PARAMETERS

### -Provider
Der Anbieter, für den ein API-Key ausgegeben werden soll.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
Dieses Cmdlet unterstützt die Common Parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, und -WarningVariable. Weitere Informationen: [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

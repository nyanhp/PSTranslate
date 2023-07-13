---
external help file: PSTranslate-help.xml
Module Name: PSTranslate
online version:
schema: 2.0.0
---

# Get-TranslationApiKey

## SYNOPSIS
Returns an API key used for translation services.

## SYNTAX

```
Get-TranslationApiKey [-Provider] <String> [<CommonParameters>]
```

## DESCRIPTION
Returns an API key used for translation services.

## EXAMPLES

### EXAMPLE 1
```
Get-TranslationApiKey -Provider 'Azure'
```

Returns the API key for connectign to azure translation services.

## PARAMETERS

### -Provider
The provider to return the API key for.

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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

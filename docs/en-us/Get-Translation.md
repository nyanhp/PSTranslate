---
external help file: PSTranslate-help.xml
Module Name: PSTranslate
online version:
schema: 2.0.0
---

# Get-Translation

## SYNOPSIS
Translates text from one language to another.

## SYNTAX

```
Get-Translation [-Value] <String[]> [-From] <CultureInfo> [-To] <CultureInfo> [[-Provider] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Translates text from one language to another.

## EXAMPLES

### EXAMPLE 1
```
Get-Content .\essay.md | Get-Translation -From en -To de
```

Translates the content of essay.md from English to German.

## PARAMETERS

### -From
THe language to translate the text from.

```yaml
Type: CultureInfo
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Provider
The translation service to use.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: (Get-PSFConfigValue -FullName 'PSTranslate.DefaultProvider')
Accept pipeline input: False
Accept wildcard characters: False
```

### -To
The language to translate the text to.

```yaml
Type: CultureInfo
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Value
The text to translate.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

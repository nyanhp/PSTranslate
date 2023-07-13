---
external help file: PSTranslate-help.xml
Module Name: PSTranslate
online version:
schema: 2.0.0
---

# Get-Translation

## SYNOPSIS
Übersetzt Text von einer in die andere Sprache.

## SYNTAX

```
Get-Translation [-Value] <String[]> [-From] <CultureInfo> [-To] <CultureInfo> [[-Provider] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Übersetzt Text von einer in die andere Sprache.

## EXAMPLES

### EXAMPLE 1
```
Get-Content .\essay.md | Get-Translation -From en -To de
```

Übersetzt den Inhalt von essay.md aus dem Englischen ins Deutsche

## PARAMETERS

### -From
Quellsprache

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
Übersetzungsanbieter der verwendet wird

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
Zielsprache

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
Der zu übersetzende Text

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
Dieses Cmdlet unterstützt die Common Parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, und -WarningVariable. Weitere Informationen: [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

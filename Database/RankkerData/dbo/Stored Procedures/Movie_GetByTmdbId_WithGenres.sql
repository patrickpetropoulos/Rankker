﻿CREATE PROCEDURE [dbo].[Movie_GetByTmdbId_WithGenres]
	@tmdbId int
AS
Begin
	set nocount on;
	SELECT m.[Id]
      ,m.[Name]
      ,m.[Tagline]
      ,m.[Overview]
      ,m.[ReleaseDate]
      ,m.[Runtime]
      ,m.[Budget]
      ,m.[Revenue]
      ,m.[TmdbId]
      ,m.[ImdbId]
      ,m.[TmdbPosterPath]
      ,m.[TmdbBackdropPath]
      ,m.[Status]
      ,m.[DateUpdated]
  FROM [Rankker].[dbo].[Movie] m
  where m.[TmdbId] = @tmdbId 

  select m.[Id] as MovieId, g.[Id] as MovieGenreId, g.[Name] as MovieGenreName
  from [Rankker].[dbo].[MovieGenre] g
  inner  join [Rankker].[dbo].[MovieGenreRel] rel on rel.MovieGenreId = g.Id
  inner join [Rankker].[dbo].[Movie] m on rel.MovieId = m.Id
  where m.TmdbId = @tmdbId 
end
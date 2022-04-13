using AutoMapper;
using ComparisonApp.Entities;
using ComparisonApp.Entities.Performance;

namespace ComparisonApp.Mapping
{
    public  class SourceMappingProfile : Profile
    {
        public SourceMappingProfile() {

            //Holdings Report
            CreateMap<HoldingsAndPositionsReport, FinalHoldings>(MemberList.None)
                .ForMember(dest => dest.Source, opt => opt.MapFrom(src => src.ClosingPrice != null ? "CoricAPP" : "GetPositionsSP"))
                //.ForMember(dest => dest.AdhocFlag, opt => opt.MapFrom(src => src.AdhocFlag ?? string.Empty))
                .ForMember(dest => dest.ClosingPrice, opt => opt.MapFrom(src => src.ClosingPrice != null ? src.ClosingPrice.Value.ToString("0.00") : src.Price != null ? src.Price.Value.ToString("0.00") : "0.00"))
                .ForMember(dest => dest.Collateral, opt => opt.MapFrom(src => src.Collateral != null ? src.Collateral : src.CollateralType != null ? src.CollateralType : string.Empty))
                //.ForMember(dest => dest.Convexity, opt => opt.MapFrom(src => 0))
                .ForMember(dest => dest.Coupon, opt => opt.MapFrom(src => src.Coupon != null ? src.Coupon.Value.ToString("0.000") : "0.000"))
                .ForMember(dest => dest.CUSIP, opt => opt.MapFrom(src => src.Cusip != null && src.Cusip == "TOTAL" ? $"{src.Cusip} {char.ToUpper(src.CellLabel[0])}{src.CellLabel.Substring(1).ToLower()}" : string.IsNullOrEmpty(src.CUSIP) && src.Cusip == null ? $"TOTAL {src.SecurityType}" : src.Cusip ?? src.CUSIP))
                //.ForMember(dest => dest.Description, opt => opt.MapFrom(src => string.Empty))
                //.ForMember(dest => dest.EffectiveDuration, opt => opt.MapFrom(src => 0))
                //.ForMember(dest => dest.InternalRating, opt => opt.MapFrom(src => src.InternalRating))
                .ForMember(dest => dest.MarketValue, opt => opt.MapFrom(src => src.MarketValue != null ? src.MarketValue.Value.ToString("0.00") : "0.00"))
                .ForMember(dest => dest.MaturityDate, opt => opt.MapFrom(src => src.MaturityDate != null && src.MaturityDate != System.DateTime.MinValue ? src.MaturityDate.Value.ToString("MM/dd/yyyy") : src.Maturity != null && src.Maturity != System.DateTime.MinValue ? src.Maturity.Value.ToString("MM/dd/yyyy") : string.Empty))
                .ForMember(dest => dest.Moodys, opt => opt.MapFrom(src => src.Moodys ?? src.RatingMoodys ?? string.Empty))
                .ForMember(dest => dest.Paramount, opt => opt.MapFrom(src => src.ParAmount != null ? src.ParAmount.Value.ToString("0.00") : src.Paramount != null ? src.Paramount.Value.ToString("0.00") : "0.00"))
                //.ForMember(dest => dest.PeriodDate, opt => opt.MapFrom(src => src.PeriodDate != System.DateTime.MinValue ? src.PeriodDate.ToString("MM/dd/yyyy") : string.Empty))
                //.ForMember(dest => dest.ProductID, opt => opt.MapFrom(src => src.ProductID))
                //.ForMember(dest => dest.Quantity, opt => opt.MapFrom(src => src.Quantity))
                .ForMember(dest => dest.SAndP, opt => opt.MapFrom(src => src.RatingSP ?? src.SAndP ?? string.Empty))
                .ForMember(dest => dest.SecurityType, opt => opt.MapFrom(src => src.CellLabel != null ? src.CellLabel : src.SecurityType))
                .ForMember(dest => dest.TsySpread, opt => opt.MapFrom(src => src.TsySpread != null ? src.TsySpread.Value.ToString("0.00") : "0.00"))
                .ForMember(dest => dest.YTW, opt => opt.MapFrom(src => src.YTW != null ? src.YTW.Value.ToString("0.00") : "0.00"));

            //Performance Mapping
            CreateMap<PerformanceAndCellData, FinalPerformance>(MemberList.None)
                .ForMember(dest => dest.Source, opt => opt.MapFrom(src => src.SinceInceptionReturn != null ? "CoricAPP" : "GetCellData"))
                //.ForMember(dest => dest.InceptionDate, opt => opt.MapFrom(src => src.InceptionDate != null ? src.InceptionDate.Value.ToString("MM/dd/yyyy") : string.Empty))
                .ForMember(dest => dest.SinceInceptionReturn, opt => opt.MapFrom(src => src.SinceInceptionReturn != null ? src.SinceInceptionReturn.Value.ToString("0.00") : src.SIDReturn != null ? src.SIDReturn.Value.ToString("0.00") : string.Empty))
                .ForMember(dest => dest.MTD, opt => opt.MapFrom(src => src.MTD != null ? src.MTD.Value.ToString("0.00") : string.Empty))
                .ForMember(dest => dest.QTD, opt => opt.MapFrom(src => src.QTD != null ? src.QTD.Value.ToString("0.00") : string.Empty))
                .ForMember(dest => dest.YTD, opt => opt.MapFrom(src => src.YTD != null ? src.YTD.Value.ToString("0.00") : string.Empty));
        }

            

    }
}
